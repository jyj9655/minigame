from PIL import Image, ImageDraw, ImageFont
import os

# 텍스트 설정
text = "사무용품 MBTI"

# 저장 파일 명 설정
output_filename = "company.png" 

# 외곽선, 그림자 색
outline_color = shadow_color = "#ff6b90"

# 파이썬 파일의 디렉토리 경로를 가져오기
script_dir = os.path.dirname(os.path.abspath(__file__))

# 이미지 파일의 상대 경로 설정
image_path = os.path.join(script_dir, "static", "images", "game-cover.jpg")

background_image = Image.open(image_path)

# 이미지 크기 설정
width, height = 300, 300

# 이미지 생성
image = Image.new("RGBA", (width, height), (255, 255, 255, 0))
draw = ImageDraw.Draw(image)

# 배경 이미지를 이미지의 크기에 맞게 조절
background_image = background_image.resize((width, height))

# 이미지에 배경 이미지 복사
image.paste(background_image, (0, 0))

# 텍스트 추가
font_size = 40
font_path = os.path.join(script_dir, "static", "ttf", "PoorStory-Regular.ttf")
font = ImageFont.truetype(font_path, font_size)

# 텍스트를 중앙에 위치시키기 위한 좌표 계산
text_width, text_height = draw.textbbox((0, 0), text, font=font)[2:]
text_x = (width - text_width) / 2
text_y = (height - text_height) / 2 - 10

# 그림자를 여러 번 중첩
for offset in range(1, 5):  
    draw.text((text_x+offset, text_y+offset), text, fill=shadow_color, font=font)

# 텍스트 외곽선 추가
draw.text((text_x-1, text_y-1), text, fill=outline_color, font=font)
draw.text((text_x+1, text_y-1), text, fill=outline_color, font=font)
draw.text((text_x-1, text_y+1), text, fill=outline_color, font=font)
draw.text((text_x+1, text_y+1), text, fill=outline_color, font=font)

# 텍스트 추가
text_color = "#FFFFFF"
draw.text((text_x, text_y), text, fill=text_color, font=font)

# 이미지 저장
image.save(output_filename)

# 이미지 보기 (필요한 경우)
# image.show()
