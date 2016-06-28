/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package convolveapp;

import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;
import java.io.File;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.TitledBorder;

public class ConvolveApp extends JFrame {
  CPanel displayPanel;

  JButton sharpenButton, blurringButton, edButton, Trynew;

  public ConvolveApp() {
    super();
    Container container = getContentPane();

    displayPanel = new CPanel();
    container.add(displayPanel);

    JPanel panel = new JPanel();
    panel.setLayout(new GridLayout(2, 2));
    panel
        .setBorder(new TitledBorder(
            "Click a Button to Perform the Associated Operation and Reset..."));

    sharpenButton = new JButton("Sharpen");
    sharpenButton.addActionListener(new ButtonListener());
    blurringButton = new JButton("Blur");
    blurringButton.addActionListener(new ButtonListener());
    edButton = new JButton("Trynew");
    edButton.addActionListener(new ButtonListener());
    Trynew = new JButton("Reset");
    Trynew.addActionListener(new ButtonListener());

    panel.add(sharpenButton);
    panel.add(blurringButton);
    panel.add(edButton);
    panel.add(Trynew);

    container.add(BorderLayout.SOUTH, panel);

    addWindowListener(new WindowAdapter() {
      public void windowClosing(WindowEvent e) {
        System.exit(0);
      }
    });
    setSize(displayPanel.getWidth(), displayPanel.getHeight() + 10);
    setVisible(true); 
  }
  public static void main(String arg[]) {
    new ConvolveApp();
  }

  class ButtonListener implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      JButton button = (JButton) e.getSource();

      if (button.equals(sharpenButton)) {
        displayPanel.sharpen();
        displayPanel.repaint();
      } else if (button.equals(blurringButton)) {
        displayPanel.blur();
        displayPanel.repaint();
      } else if (button.equals(edButton)) {
        displayPanel.Trynew();
        displayPanel.repaint();
      } else if (button.equals(Trynew)) {
        displayPanel.reset();
        displayPanel.repaint();
       
      }
    }
  }
}

class CPanel extends JLabel {
  Image displayImage;

  BufferedImage biSrc;

  BufferedImage biDest; // Destination image is mandetory.

  BufferedImage bi; // Only an additional reference.

  Graphics2D big;

  CPanel() {
    setBackground(Color.black);
    loadImage();
    setSize(displayImage.getWidth(this), displayImage.getWidth(this)); 
    createBufferedImages();
    bi = biSrc;
  }

  public void loadImage() {
   JFileChooser  fc = new JFileChooser();
      ImageIcon icon;
      int returnVal = fc.showOpenDialog(this);
      File file= fc.getSelectedFile();
      String name = file.getAbsolutePath();
      if(name!=null&&name.toLowerCase().endsWith(".jpg") ||
                    name.toLowerCase().endsWith(".jpeg") ||
                    name.toLowerCase().endsWith(".gif") ||
                    name.toLowerCase().endsWith(".png")){
          try{     
          displayImage= ImageIO.read(file);
   
          }catch(Exception e){}
  }
  }
  public void createBufferedImages() {
    biSrc = new BufferedImage(displayImage.getWidth(this), displayImage
        .getHeight(this), BufferedImage.TYPE_INT_RGB);

    big = biSrc.createGraphics();
    big.drawImage(displayImage, 0, 0, this);

    biDest = new BufferedImage(displayImage.getWidth(this), displayImage
        .getHeight(this), BufferedImage.TYPE_INT_RGB);
  }

  public void sharpen() {
    float data[] = { -1.0f, -1.0f, -1.0f, -1.0f, 9.0f, -1.0f, -1.0f, -1.0f,
        -1.0f };
    Kernel kernel = new Kernel(3, 3, data);
    ConvolveOp convolve = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP,
        null);
    convolve.filter(biSrc, biDest);
    bi = biDest;
  }

  public void blur() {
    float data[] = new float[400];
    for (int i = 0; i < 400; i++)
     data[i] = 1.0f/970.0f;

    Kernel kernel = new Kernel(20, 20, data);
    ConvolveOp convolve = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP,
        null);
    convolve.filter(biSrc, biDest);
    bi = biDest;
  }

    public void Trynew() {

        loadImage();
  }

  public void reset() {
    big.setColor(Color.black);
    big.clearRect(0, 0, bi.getWidth(this), bi.getHeight(this));
    big.drawImage(displayImage, 0, 0, this);
    bi = biSrc;
  }

  public void update(Graphics g) {
    g.clearRect(0, 0, getWidth(), getHeight());
    paintComponent(g);
  }

  public void paintComponent(Graphics g) {
    super.paintComponent(g);
    Graphics2D g2D = (Graphics2D) g;

    g2D.drawImage(bi, 0, 0, this);
  }
}
