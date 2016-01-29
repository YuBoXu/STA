package util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.color.ColorSpace;
import java.awt.geom.AffineTransform;
import java.awt.image.*;
import java.io.File;
import java.io.IOException;

/**
 * Created by martsforever on 2016/1/28.
 */
public class ImageUtils {

    public static String IMAGE_TYPE_GIF = "gif";// 图形交换格式
    public static String IMAGE_TYPE_JPG = "jpg";// 联合照片专家组
    public static String IMAGE_TYPE_JPEG = "jpeg";// 联合照片专家组
    public static String IMAGE_TYPE_BMP = "bmp";// 英文Bitmap（位图）的简写，它是Windows操作系统中的标准图像文件格式
    public static String IMAGE_TYPE_PNG = "png";// 可移植网络图形
    public static String IMAGE_TYPE_PSD = "psd";// Photoshop的专用格式Photoshop

    public static boolean SCALE_TYPE_Enlargement = true;
    public static boolean SCALE_TYOE_Reduction = false;

    /**
     * 按比例缩放
     *
     * @param srcPath    源图片路径
     * @param targetPath 目标图片路径
     * @param scale      缩放级别
     */
    public final static void scaleByRatio(String srcPath, String targetPath,
                                          double scale) {
        try {
            BufferedImage srcBufferedImage = ImageIO.read(new File(srcPath)); // 读入文件
            int width = srcBufferedImage.getWidth(); // 得到源图宽
            int height = srcBufferedImage.getHeight(); // 得到源图长
            width = (int) (width * scale);
            height = (int) (height * scale);
            /*创建此图像的缩放版本。返回一个新的 image 对象，默认情况下，该对象按指定的 width 和 height 呈现图像。即使已经完全加载了初始源图像，新的 image 对象也可以被异步加载。
如果 width 或 height 为负数，则替换该值以维持初始图像尺寸的高宽比。如果 width 和 height 都为负，则使用初始图像尺寸。*/
            Image image = srcBufferedImage.getScaledInstance(width, height,
                    Image.SCALE_DEFAULT);
            BufferedImage targetBufferedImage = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = targetBufferedImage.getGraphics();
            g.drawImage(image, 0, 0, null); // 绘制缩小后的图
            g.dispose();
            ImageIO.write(targetBufferedImage, "JPEG", new File(targetPath));// 输出到文件流
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**根据高度或者宽度地动缩放图片
     * @param srcPath
     * @param targetPath
     * @param height
     * @param width
     */
    public final static void scaleByHeightOrWodth(String srcPath, String targetPath,
                                                  int height, int width) {
        try {
            BufferedImage srcBufferedImage = ImageIO.read(new File(srcPath)); // 读入文件

            double oldHeight = srcBufferedImage.getHeight();
            double oldWidth =srcBufferedImage.getWidth();

            if (height<0){
                height = (int)(((double)width)/oldWidth*oldHeight);
            }
            else if (width<0){
                width = (int)(((double)height)/oldHeight*oldWidth);
            }
            /*创建此图像的缩放版本。返回一个新的 image 对象，默认情况下，该对象按指定的 width 和 height 呈现图像。即使已经完全加载了初始源图像，新的 image 对象也可以被异步加载。
如果 width 或 height 为负数，则替换该值以维持初始图像尺寸的高宽比。如果 width 和 height 都为负，则使用初始图像尺寸。*/
            Image image = srcBufferedImage.getScaledInstance(width, height,
                    Image.SCALE_DEFAULT);
            BufferedImage targetBufferedImage = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = targetBufferedImage.getGraphics();
            g.drawImage(image, 0, 0, null); // 绘制缩小后的图
            g.dispose();
            ImageIO.write(targetBufferedImage, "JPEG", new File(targetPath));// 输出到文件流
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据高度和宽度进行缩放
     *
     * @param srcPath    源图片路径
     * @param targetPath 目标图片路径
     * @param height     目标高度
     * @param width      目标宽度
     * @param isPadding  图片是否填充白色区域
     */
    public final static void scaleByHeightAndWidth(String srcPath, String targetPath, int height, int width, boolean isPadding) {
        try {
            double ratio = 0.0; // 缩放比例
            File f = new File(srcPath);
            BufferedImage bi = ImageIO.read(f);
            Image itemp = bi.getScaledInstance(width, height, bi.SCALE_SMOOTH);
            // 计算比例
            if ((bi.getHeight() > height) || (bi.getWidth() > width)) {
                if (bi.getHeight() > bi.getWidth()) {
                    ratio = (new Integer(height)).doubleValue()
                            / bi.getHeight();
                } else {
                    ratio = (new Integer(width)).doubleValue() / bi.getWidth();
                }
                AffineTransformOp op = new AffineTransformOp(AffineTransform
                        .getScaleInstance(ratio, ratio), null);
                itemp = op.filter(bi, null);
            }
            if (isPadding) {//补白
                BufferedImage image = new BufferedImage(width, height,
                        BufferedImage.TYPE_INT_RGB);
                Graphics2D g = image.createGraphics();
                g.setColor(Color.white);
                g.fillRect(0, 0, width, height);
                if (width == itemp.getWidth(null))
                    g.drawImage(itemp, 0, (height - itemp.getHeight(null)) / 2,
                            itemp.getWidth(null), itemp.getHeight(null),
                            Color.white, null);
                else
                    g.drawImage(itemp, (width - itemp.getWidth(null)) / 2, 0,
                            itemp.getWidth(null), itemp.getHeight(null),
                            Color.white, null);
                g.dispose();
                itemp = image;
            }
            ImageIO.write((BufferedImage) itemp, "JPEG", new File(targetPath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 按指定起点坐标和宽高切割
     *
     * @param srcPath
     * @param targetPath
     * @param x
     * @param y
     * @param width
     * @param height
     */
    public final static void cut(String srcPath, String targetPath,
                                 int x, int y, int width, int height) {
        try {
            // 读取源图像
            BufferedImage bi = ImageIO.read(new File(srcPath));
            int srcWidth = bi.getHeight(); // 源图宽度
            int srcHeight = bi.getWidth(); // 源图高度
            if (srcWidth > 0 && srcHeight > 0) {
                Image image = bi.getScaledInstance(srcWidth, srcHeight,
                        Image.SCALE_DEFAULT);
                // 四个参数分别为图像起点坐标和宽高
                // 即: CropImageFilter(int x,int y,int width,int height)
                ImageFilter cropFilter = new CropImageFilter(x, y, width, height);
                Image img = Toolkit.getDefaultToolkit().createImage(
                        new FilteredImageSource(image.getSource(),
                                cropFilter));
                BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                Graphics g = tag.getGraphics();
                g.drawImage(img, 0, 0, width, height, null); // 绘制切割后的图
                g.dispose();
                // 输出为文件
                ImageIO.write(tag, "JPEG", new File(targetPath));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 指定切片的行数和列数对图片进行切割
     *
     * @param srcPath
     * @param targetPath
     * @param rows
     * @param cols
     */
    public final static void cut2(String srcPath, String targetPath,
                                  int rows, int cols) {
        try {
            if (rows <= 0 || rows > 20) rows = 2; // 切片行数
            if (cols <= 0 || cols > 20) cols = 2; // 切片列数
            // 读取源图像
            BufferedImage bi = ImageIO.read(new File(srcPath));
            int srcWidth = bi.getHeight(); // 源图宽度
            int srcHeight = bi.getWidth(); // 源图高度
            if (srcWidth > 0 && srcHeight > 0) {
                Image img;
                ImageFilter cropFilter;
                Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
                int destWidth = srcWidth; // 每张切片的宽度
                int destHeight = srcHeight; // 每张切片的高度
                // 计算切片的宽度和高度
                if (srcWidth % cols == 0) {
                    destWidth = srcWidth / cols;
                } else {
                    destWidth = (int) Math.floor(srcWidth / cols) + 1;
                }
                if (srcHeight % rows == 0) {
                    destHeight = srcHeight / rows;
                } else {
                    destHeight = (int) Math.floor(srcWidth / rows) + 1;
                }
                // 循环建立切片
                // 改进的想法:是否可用多线程加快切割速度
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols; j++) {
                        // 四个参数分别为图像起点坐标和宽高
                        // 即: CropImageFilter(int x,int y,int width,int height)
                        cropFilter = new CropImageFilter(j * destWidth, i * destHeight,
                                destWidth, destHeight);
                        img = Toolkit.getDefaultToolkit().createImage(
                                new FilteredImageSource(image.getSource(),
                                        cropFilter));
                        BufferedImage tag = new BufferedImage(destWidth,
                                destHeight, BufferedImage.TYPE_INT_RGB);
                        Graphics g = tag.getGraphics();
                        g.drawImage(img, 0, 0, null); // 绘制缩小后的图
                        g.dispose();
                        // 输出为文件
                        ImageIO.write(tag, "JPEG", new File(targetPath
                                + "_r" + i + "_c" + j + ".jpg"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 指定切片的宽度和高度对图片进行切割
     *
     * @param srcPath
     * @param targetPath
     * @param destWidth
     * @param destHeight
     */
    public final static void cut3(String srcPath, String targetPath,
                                  int destWidth, int destHeight) {
        try {
            if (destWidth <= 0) destWidth = 200; // 切片宽度
            if (destHeight <= 0) destHeight = 150; // 切片高度
            // 读取源图像
            BufferedImage bi = ImageIO.read(new File(srcPath));
            int srcWidth = bi.getHeight(); // 源图宽度
            int srcHeight = bi.getWidth(); // 源图高度
            if (srcWidth > destWidth && srcHeight > destHeight) {
                Image img;
                ImageFilter cropFilter;
                Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
                int cols = 0; // 切片横向数量
                int rows = 0; // 切片纵向数量
                // 计算切片的横向和纵向数量
                if (srcWidth % destWidth == 0) {
                    cols = srcWidth / destWidth;
                } else {
                    cols = (int) Math.floor(srcWidth / destWidth) + 1;
                }
                if (srcHeight % destHeight == 0) {
                    rows = srcHeight / destHeight;
                } else {
                    rows = (int) Math.floor(srcHeight / destHeight) + 1;
                }
                // 循环建立切片
                // 改进的想法:是否可用多线程加快切割速度
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols; j++) {
                        // 四个参数分别为图像起点坐标和宽高
                        // 即: CropImageFilter(int x,int y,int width,int height)
                        cropFilter = new CropImageFilter(j * destWidth, i * destHeight,
                                destWidth, destHeight);
                        img = Toolkit.getDefaultToolkit().createImage(
                                new FilteredImageSource(image.getSource(),
                                        cropFilter));
                        BufferedImage tag = new BufferedImage(destWidth,
                                destHeight, BufferedImage.TYPE_INT_RGB);
                        Graphics g = tag.getGraphics();
                        g.drawImage(img, 0, 0, null); // 绘制缩小后的图
                        g.dispose();
                        // 输出为文件
                        ImageIO.write(tag, "JPEG", new File(targetPath
                                + "_r" + i + "_c" + j + ".jpg"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 图像类型转换
     *
     * @param srcPath
     * @param targetPath
     * @param targetImageType
     */
    public final static void convert(String srcPath, String targetPath, String targetImageType) {
        try {
            File f = new File(srcPath);
            f.canRead();
            f.canWrite();
            BufferedImage src = ImageIO.read(f);
            ImageIO.write(src, targetImageType, new File(targetPath));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 彩色转黑白
     *
     * @param srcImageFile
     * @param targetPath
     */
    public final static void gray(String srcImageFile, String targetPath) {
        try {
            BufferedImage src = ImageIO.read(new File(srcImageFile));
            ColorSpace cs = ColorSpace.getInstance(ColorSpace.CS_GRAY);
            ColorConvertOp op = new ColorConvertOp(cs, null);
            src = op.filter(src, null);
            ImageIO.write(src, "JPEG", new File(targetPath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 给图片添加文字水印
     *
     * @param watermark
     * @param srcPath
     * @param targetPath
     * @param fontName
     * @param fontStyle
     * @param color
     * @param fontSize
     * @param x
     * @param y
     * @param alpha
     */
    public final static void addWaterMarking(String watermark,
                                             String srcPath, String targetPath, String fontName,
                                             int fontStyle, Color color, int fontSize, int x,
                                             int y, float alpha) {
        try {
            File img = new File(srcPath);
            Image src = ImageIO.read(img);
            int width = src.getWidth(null);
            int height = src.getHeight(null);
            BufferedImage image = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics2D g = image.createGraphics();
            g.drawImage(src, 0, 0, width, height, null);
            g.setColor(color);
            g.setFont(new Font(fontName, fontStyle, fontSize));
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
                    alpha));
            // 在指定坐标绘制水印文字
            g.drawString(watermark, (width - (getLength(watermark) * fontSize))
                    / 2 + x, (height - fontSize) / 2 + y);
            g.dispose();
            ImageIO.write((BufferedImage) image, "JPEG", new File(targetPath));// 输出到文件流
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public final static void addWaterMarking2(String watermark, String srcPath, String targetPath,
                                              String fontName, int fontStyle, Color color, int fontSize, int x,
                                              int y, float alpha) {
        try {
            File img = new File(srcPath);
            Image src = ImageIO.read(img);
            int width = src.getWidth(null);
            int height = src.getHeight(null);
            BufferedImage image = new BufferedImage(width, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics2D g = image.createGraphics();
            g.drawImage(src, 0, 0, width, height, null);
            g.setColor(color);
            g.setFont(new Font(fontName, fontStyle, fontSize));
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
                    alpha));
            // 在指定坐标绘制水印文字
            g.drawString(watermark, (width - (getLength(watermark) * fontSize))
                    / 2 + x, (height - fontSize) / 2 + y);
            g.dispose();
            ImageIO.write((BufferedImage) image, "JPEG", new File(targetPath));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 添加图片水印
     *
     * @param waterMarketingImg
     * @param srcPath
     * @param targetPath
     * @param x
     * @param y
     * @param alpha
     */
    public final static void addWaterMarking3(String waterMarketingImg, String srcPath, String targetPath,
                                              int x, int y, float alpha) {
        try {
            File img = new File(srcPath);
            Image src = ImageIO.read(img);
            int wideth = src.getWidth(null);
            int height = src.getHeight(null);
            BufferedImage image = new BufferedImage(wideth, height,
                    BufferedImage.TYPE_INT_RGB);
            Graphics2D g = image.createGraphics();
            g.drawImage(src, 0, 0, wideth, height, null);
            // 水印文件
            Image src_biao = ImageIO.read(new File(waterMarketingImg));
            int wideth_biao = src_biao.getWidth(null);
            int height_biao = src_biao.getHeight(null);
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
                    alpha));
            g.drawImage(src_biao, (wideth - wideth_biao) / 2,
                    (height - height_biao) / 2, wideth_biao, height_biao, null);
            // 水印文件结束
            g.dispose();
            ImageIO.write((BufferedImage) image, "JPEG", new File(targetPath));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public final static int getLength(String text) {
        int length = 0;
        for (int i = 0; i < text.length(); i++) {
            if (new String(text.charAt(i) + "").getBytes().length > 1) {
                length += 2;
            } else {
                length += 1;
            }
        }
        return length / 2;
    }
}
