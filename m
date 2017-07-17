Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA61EE00C28; Mon, 17 Jul 2017 01:59:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBCD3E00C22
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 01:59:58 -0700 (PDT)
Received: by mail-pg0-f54.google.com with SMTP id k14so76418650pgr.0
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=QC0EfvMYyHoM5IN4AZtekiQ+zGtwjsWOVrULo7pTXr0=;
	b=ScqBamliuIs4Bjr0VZIsnzkGLq+OrxoFlGYVYSNbAmYw9EkMqTSg/vlv8w1Y7rbrto
	z780VR662+iVQNR2yb2A8jkU1I4DZFYF7rmYhtHh81njqIbf6+mIzgpSipDSGUbTo0E9
	6+AN3WsCkcx4cMn80kp+pF35PkR19r8bJYBvhbU2mRYZ55zf6ymyqAZupQLON4dj34/P
	DTfH/fRS5SWh2okzyPSPMMDcpexujjY6xpjCC4FHRejp6Z9WsW7pa4R5nXJqEiaTuojH
	4Eu2x3YMcVO5togF5OU+E6xjcCmovx+M4nlyqWwl1JrekYyhu1YpbKnv76WqIij9b2Nd
	87Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=QC0EfvMYyHoM5IN4AZtekiQ+zGtwjsWOVrULo7pTXr0=;
	b=Y50Ep6prXC8A48dfF2ry+s8Ykrp7evTLHFN83AphK3dD3BXOD2ar+m3HIlpmZInLwH
	mVYVXEJSIUWHtDaxC3jMGpFmWizfX8/vmDXF8RRVhEVeAB23SNthto/YytZbVJlIBPFb
	NrjBt5IdNQ3Ax3dw/UEjg6pjfhhQX1tXY0Id5+/XJoHsFKJ9wsj+E0+uk9NnagPcqBUV
	0XTZiOb3FgMN2Y1lvVBv9nPCxJkD7+9Kr/4wzTz4ISYJtlbiafQEfXk01HKkL3rCbeND
	PhNFujFjkykHVDmsDHHGOlt00UxFGTAaTu5OjvDwyvk4kfaHASS4E0zfgBHSnpogp/C5
	tArg==
X-Gm-Message-State: AIVw112jwFzXjyBxuHfNAkrVEMnTlJbOljx+FzxfYnlKTLPbkbtYfv2w
	GPC/k4QqG7OL9Xhx
X-Received: by 10.84.178.37 with SMTP id y34mr29707117plb.223.1500281997614;
	Mon, 17 Jul 2017 01:59:57 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:2c33:3ea6:a4ab:3bde?
	([2001:8003:804a:b500:2c33:3ea6:a4ab:3bde])
	by smtp.gmail.com with ESMTPSA id
	n13sm28959553pgs.0.2017.07.17.01.59.55 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 01:59:56 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <bb2ad650-ed17-7229-6417-8b1be8345874@gmail.com>
Date: Mon, 17 Jul 2017 16:59:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: SPI_IOC_MESSAGE: Bad file descriptor
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jul 2017 08:59:59 -0000
Content-Type: multipart/alternative;
	boundary="------------AC98D2E8B55F44FBA50EEE03"
Content-Language: en-US

--------------AC98D2E8B55F44FBA50EEE03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Meta-TI Members,

I tried to transmit bytes via SPI but

I got :

===

root@beaglebone:~/SPIDEV# ./spiDevLib
/dev/spidev1.0: spi mode 0, 8 bits per word, 24000000 Hz max
SPI_IOC_MESSAGE: Bad file descriptor
===

What do I miss here ?

Code :

int spi_init(char filename[40])
     {
         int file;
     __u8    mode, lsb, bits;
     __u32 speed=2500000;

         if ((file = open(filename,O_RDWR)) < 0)
         {
             printf("Failed to open the bus.");
             /* ERROR HANDLING; you can check errno to see what went 
wrong */
         //com_serial=0;
             exit(1);
             }

         ///////////////
         // Verifications
         ///////////////
         //possible modes: mode |= SPI_LOOP; mode |= SPI_CPHA; mode |= 
SPI_CPOL; mode |= SPI_LSB_FIRST; mode |= SPI_CS_HIGH; mode |= SPI_3WIRE; 
mode |= SPI_NO_CS; mode |= SPI_READY;
         //multiple possibilities using |
         /*
             if (ioctl(file, SPI_IOC_WR_MODE, &mode)<0)   {
                 perror("can't set spi mode");
                 return;
                 }
         */

             if (ioctl(file, SPI_IOC_RD_MODE, &mode) < 0)
                 {
                 perror("SPI rd_mode");
                 return;
                 }
             if (ioctl(file, SPI_IOC_RD_LSB_FIRST, &lsb) < 0)
                 {
                 perror("SPI rd_lsb_fist");
                 return;
                 }
         //sunxi supports only 8 bits
         /*
             if (ioctl(file, SPI_IOC_WR_BITS_PER_WORD, (__u8[1]){8})<0)
                 {
                 perror("can't set bits per word");
                 return;
                 }
         */
             if (ioctl(file, SPI_IOC_RD_BITS_PER_WORD, &bits) < 0)
                 {
                 perror("SPI bits_per_word");
                 return;
                 }
         /*
             if (ioctl(file, SPI_IOC_WR_MAX_SPEED_HZ, &speed)<0)
                 {
                 perror("can't set max speed hz");
                 return;
                 }
         */
             if (ioctl(file, SPI_IOC_RD_MAX_SPEED_HZ, &speed) < 0)
                 {
                 perror("SPI max_speed_hz");
                 return;
                 }


     printf("%s: spi mode %d, %d bits %sper word, %d Hz max\n",filename, 
mode, bits, lsb ? "(lsb first) " : "", speed);

     //xfer[0].tx_buf = (unsigned long)buf;
     xfer[0].len = 3; /* Length of  command to write*/
     xfer[0].cs_change = 0; /* Keep CS activated */
     xfer[0].delay_usecs = 0, //delay in us
     xfer[0].speed_hz = 2500000, //speed
     xfer[0].bits_per_word = 8, // bites per word 8

     //xfer[1].rx_buf = (unsigned long) buf2;
     xfer[1].len = 4; /* Length of Data to read */
     xfer[1].cs_change = 0; /* Keep CS activated */
     xfer[0].delay_usecs = 0;
     xfer[0].speed_hz = 2500000;
     xfer[0].bits_per_word = 8;

     return file;
     }

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------AC98D2E8B55F44FBA50EEE03
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta-TI Members,</p>
    <p>I tried to transmit bytes via SPI but <br>
    </p>
    <p>I got :</p>
    <p>===<br>
    </p>
    <p>root@beaglebone:~/SPIDEV# ./spiDevLib <br>
      /dev/spidev1.0: spi mode 0, 8 bits per word, 24000000 Hz max<br>
      SPI_IOC_MESSAGE: Bad file descriptor<br>
      ===</p>
    <p>What do I miss here ?</p>
    <p>Code :</p>
    <p>int spi_init(char filename[40])<br>
          {<br>
              int file;<br>
          __u8    mode, lsb, bits;<br>
          __u32 speed=2500000;<br>
       <br>
              if ((file = open(filename,O_RDWR)) &lt; 0)<br>
              {<br>
                  printf("Failed to open the bus.");<br>
                  /* ERROR HANDLING; you can check errno to see what
      went wrong */<br>
              //com_serial=0;<br>
                  exit(1);<br>
                  }<br>
       <br>
              ///////////////<br>
              // Verifications<br>
              ///////////////<br>
              //possible modes: mode |= SPI_LOOP; mode |= SPI_CPHA; mode
      |= SPI_CPOL; mode |= SPI_LSB_FIRST; mode |= SPI_CS_HIGH; mode |=
      SPI_3WIRE; mode |= SPI_NO_CS; mode |= SPI_READY;<br>
              //multiple possibilities using |<br>
              /*<br>
                  if (ioctl(file, SPI_IOC_WR_MODE, &amp;mode)&lt;0)   {<br>
                      perror("can't set spi mode");<br>
                      return;<br>
                      }<br>
              */<br>
       <br>
                  if (ioctl(file, SPI_IOC_RD_MODE, &amp;mode) &lt; 0)<br>
                      {<br>
                      perror("SPI rd_mode");<br>
                      return;<br>
                      }<br>
                  if (ioctl(file, SPI_IOC_RD_LSB_FIRST, &amp;lsb) &lt;
      0)<br>
                      {<br>
                      perror("SPI rd_lsb_fist");<br>
                      return;<br>
                      }<br>
              //sunxi supports only 8 bits<br>
              /*<br>
                  if (ioctl(file, SPI_IOC_WR_BITS_PER_WORD,
      (__u8[1]){8})&lt;0)   <br>
                      {<br>
                      perror("can't set bits per word");<br>
                      return;<br>
                      }<br>
              */<br>
                  if (ioctl(file, SPI_IOC_RD_BITS_PER_WORD, &amp;bits)
      &lt; 0) <br>
                      {<br>
                      perror("SPI bits_per_word");<br>
                      return;<br>
                      }<br>
              /*<br>
                  if (ioctl(file, SPI_IOC_WR_MAX_SPEED_HZ,
      &amp;speed)&lt;0)  <br>
                      {<br>
                      perror("can't set max speed hz");<br>
                      return;<br>
                      }<br>
              */<br>
                  if (ioctl(file, SPI_IOC_RD_MAX_SPEED_HZ, &amp;speed)
      &lt; 0) <br>
                      {<br>
                      perror("SPI max_speed_hz");<br>
                      return;<br>
                      }<br>
           <br>
       <br>
          printf("%s: spi mode %d, %d bits %sper word, %d Hz
      max\n",filename, mode, bits, lsb ? "(lsb first) " : "", speed);<br>
       <br>
          //xfer[0].tx_buf = (unsigned long)buf;<br>
          xfer[0].len = 3; /* Length of  command to write*/<br>
          xfer[0].cs_change = 0; /* Keep CS activated */<br>
          xfer[0].delay_usecs = 0, //delay in us<br>
          xfer[0].speed_hz = 2500000, //speed<br>
          xfer[0].bits_per_word = 8, // bites per word 8<br>
       <br>
          //xfer[1].rx_buf = (unsigned long) buf2;<br>
          xfer[1].len = 4; /* Length of Data to read */<br>
          xfer[1].cs_change = 0; /* Keep CS activated */<br>
          xfer[0].delay_usecs = 0;<br>
          xfer[0].speed_hz = 2500000;<br>
          xfer[0].bits_per_word = 8;<br>
       <br>
          return file;<br>
          }<br>
    </p>
    <div class="moz-signature">-- <br>
      <b>
        <p style="color:blue;"> /*******/<br>
          Sent by Ubuntu LTS 16.04,<br>
          Kind regards,<br>
          Riko Ho<br>
          /*******/<br>
        </p>
      </b></div>
  </body>
</html>

--------------AC98D2E8B55F44FBA50EEE03--
