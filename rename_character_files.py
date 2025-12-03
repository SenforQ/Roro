#!/usr/bin/env python3
import os
import subprocess
import shutil
from pathlib import Path

def convert_to_webp(input_path, output_path):
    """将图片转换为 webp 格式"""
    try:
        subprocess.run([
            'ffmpeg', '-i', str(input_path),
            '-vf', 'scale=iw:ih',
            '-quality', '90',
            '-y',
            str(output_path)
        ], check=True, capture_output=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error converting {input_path} to webp: {e}")
        return False

def extract_video_thumbnail(video_path, output_path):
    """从视频中提取封面图并转换为 webp"""
    try:
        # 提取第一帧作为封面
        subprocess.run([
            'ffmpeg', '-i', str(video_path),
            '-vf', 'scale=iw:ih',
            '-vframes', '1',
            '-quality', '90',
            '-y',
            str(output_path)
        ], check=True, capture_output=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error extracting thumbnail from {video_path}: {e}")
        return False

def process_character_folder(base_path):
    """处理 character 文件夹下的所有子文件夹"""
    base_path = Path(base_path)
    
    # 获取所有数字文件夹
    folders = sorted([f for f in base_path.iterdir() if f.is_dir() and f.name.isdigit()], 
                     key=lambda x: int(x.name))
    
    for folder in folders:
        folder_num = folder.name
        print(f"\n处理文件夹: {folder_num}")
        
        # 获取所有文件
        files = list(folder.iterdir())
        
        # 分离图片和视频文件
        image_files = []
        video_files = []
        
        for file in files:
            if file.is_file() and not file.name.startswith('.'):
                ext = file.suffix.lower()
                if ext in ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp']:
                    image_files.append(file)
                elif ext in ['.mp4', '.mov', '.avi', '.mkv', '.flv']:
                    video_files.append(file)
        
        # 按文件名排序
        image_files.sort(key=lambda x: x.name)
        video_files.sort(key=lambda x: x.name)
        
        # 处理图片文件
        for idx, img_file in enumerate(image_files, 1):
            new_name = f"character_{folder_num}_img_{idx}.webp"
            new_path = folder / new_name
            
            if img_file.suffix.lower() == '.webp':
                # 已经是 webp 格式，直接重命名
                if img_file.name != new_name:
                    img_file.rename(new_path)
                    print(f"  重命名图片: {img_file.name} -> {new_name}")
            else:
                # 需要转换为 webp
                if convert_to_webp(img_file, new_path):
                    img_file.unlink()  # 删除原文件
                    print(f"  转换并重命名图片: {img_file.name} -> {new_name}")
        
        # 处理视频文件
        for idx, video_file in enumerate(video_files, 1):
            new_name = f"character_{folder_num}_video_{idx}.mp4"
            new_path = folder / new_name
            
            # 重命名视频文件
            if video_file.suffix.lower() != '.mp4':
                # 如果不是 mp4，需要转换
                try:
                    subprocess.run([
                        'ffmpeg', '-i', str(video_file),
                        '-c:v', 'libx264',
                        '-c:a', 'aac',
                        '-y',
                        str(new_path)
                    ], check=True, capture_output=True)
                    video_file.unlink()
                    print(f"  转换并重命名视频: {video_file.name} -> {new_name}")
                except subprocess.CalledProcessError as e:
                    print(f"  错误转换视频 {video_file.name}: {e}")
                    continue
            else:
                if video_file.name != new_name:
                    video_file.rename(new_path)
                    print(f"  重命名视频: {video_file.name} -> {new_name}")
            
            # 提取视频封面图
            thumbnail_name = f"character_{folder_num}_video_{idx}_thumb.webp"
            thumbnail_path = folder / thumbnail_name
            
            if extract_video_thumbnail(new_path, thumbnail_path):
                print(f"  提取封面图: {thumbnail_name}")
            else:
                print(f"  警告: 无法提取视频 {new_name} 的封面图")

if __name__ == "__main__":
    character_path = "/Users/gjm4senfor/Desktop/Roro/assets/character"
    
    if not os.path.exists(character_path):
        print(f"错误: 路径不存在 {character_path}")
        exit(1)
    
    print("开始处理 character 文件夹...")
    process_character_folder(character_path)
    print("\n处理完成！")

