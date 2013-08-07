Return-Path: <lm15g10@ecs.soton.ac.uk>
Received: from falcon.ecs.soton.ac.uk (falcon.ecs.soton.ac.uk [152.78.68.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF2D7E0052E
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2013 09:48:03 -0700 (PDT)
Received: from falcon.ecs.soton.ac.uk (localhost.ecs.soton.ac.uk [127.0.0.1])
	by falcon.ecs.soton.ac.uk (8.13.8/8.13.8) with ESMTP id
	r77GluAF027341
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2013 17:47:56 +0100
X-DKIM: Sendmail DKIM Filter v2.8.2 falcon.ecs.soton.ac.uk r77GluAF027341
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=ecs.soton.ac.uk;
	s=201304; t=1375894076; bh=0iDsMO7J/Xal6Pnb/mwGDvFEI00=;
	h=Date:From:MIME-Version:To:Subject:References;
	b=sB4XqAKMybAOP9LgxKYprQpSxUsjVFoe6+0iUNrLnwlTTsYkRE+GgaxYyagBROu2H
	5D7tP2R3bia/hzWYK2vAVSJ4GF+x6db7jPVUBtplV2X3i+OjrUjTHe3XmEi3JdxN9F
	OLme+X8V4QqDYIIYu/+Iok8n1VTkQvu0CwLyAoMc=
Received: from gander.ecs.soton.ac.uk (gander.ecs.soton.ac.uk
	[2001:630:d0:f102::25d])
	by falcon.ecs.soton.ac.uk (falcon.ecs.soton.ac.uk
	[2001:630:d0:f102::25e]) envelope-from <lm15g10@ecs.soton.ac.uk>
	with ESMTP (valid=N/A) id p76Hly0544503227me ret-id none;
	Wed, 07 Aug 2013 17:47:56 +0100
Received: from [IPv6:2001:630:d0:f118:d497:1295:4b1f:c85]
	([IPv6:2001:630:d0:f118:d497:1295:4b1f:c85]) (authenticated bits=0)
	by gander.ecs.soton.ac.uk (8.13.8/8.13.8) with ESMTP id r77GlreG009893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2013 17:47:54 +0100
Message-ID: <EMEW3|8b99a1cb4ed14db9fdac946435b84df4p76Hly07lm15g10|ecs.soton.ac.uk|52027A39.3070700@ecs.soton.ac.uk>
Date: Wed, 07 Aug 2013 17:47:53 +0100
From: Luis Alfonso Maeda-Nunez <lm15g10@ecs.soton.ac.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
X-ECS-MailScanner: Found to be clean, Found to be clean
X-smtpf-Report: sid=p76Hly054450322700; tid=p76Hly0544503227me;
	client=relay,ipv6; mail=; rcpt=; nrcpt=1:0; fails=0
References: <52027A39.3070700@ecs.soton.ac.uk>
X-ECS-MailScanner-Information: Please contact the ISP for more information
X-ECS-MailScanner-ID: r77GluAF027341
X-ECS-MailScanner-From: lm15g10@ecs.soton.ac.uk
Subject: Is it possible to change the operating voltage at a particular frequency for BBxM
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
X-List-Received-Date: Wed, 07 Aug 2013 16:48:06 -0000
Content-Type: multipart/alternative;
	boundary="------------030608030701010800080807"

--------------030608030701010800080807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am using the BBxM revC1, Ubuntu 12.04 with kernel 3.7.10-x10+.
Does anyone know if it is possible to run the BBxM at a different 
voltage than the one stated?
For example running at lowest frequency (300MHz) the system reports:

|
root@arm:/# cat /sys/class/regulator/regulator.4/name
vdd_mpu_iva

root@arm:/# cat /sys/class/regulator/regulator.4/microvolts
1012500

root@arm:/# cat /sys/class/regulator/regulator.4/max_microvolts
1450000

root@arm:/# cat /sys/class/regulator/regulator.4/min_microvolts
600000

|

Is it possible to change that "1012500" to lets say "1000000" or 
"900000"?*I am testing for reliability so I want to push the voltage as 
low as possible.*

According to the BBxM datasheet page 59 (7.7.5) VDD1 (vdd_mpu_iva) may 
be controlled using the SmartReflex controller (by I2C), configuring the 
output voltage of the TPS65950 between 0.6V and 1.45V in steps of 12.5mV 
(as stated before).

I know it may have to be done at Kernel cross-compiling stage, so 
digging into the kernel source code I found in 
<kernel>/arch/arm/mach-omap2/omap3xxx_data.c

Line:58
|
/* 36xx */

/* VDD1 */

#define OMAP3630_VDD_MPU_OPP50_UV1012500
#define OMAP3630_VDD_MPU_OPP100_UV1200000
#define OMAP3630_VDD_MPU_OPP120_UV1325000
#define OMAP3630_VDD_MPU_OPP1G_UV1375000

struct omap_volt_data omap36xx_vddmpu_volt_data[] = {
VOLT_DATA_DEFINE(OMAP3630_VDD_MPU_OPP50_UV, 
OMAP3630_CONTROL_FUSE_OPP50_VDD1, 0xf4, 0x0c),
VOLT_DATA_DEFINE(OMAP3630_VDD_MPU_OPP100_UV, 
OMAP3630_CONTROL_FUSE_OPP100_VDD1, 0xf9, 0x16),
VOLT_DATA_DEFINE(OMAP3630_VDD_MPU_OPP120_UV, 
OMAP3630_CONTROL_FUSE_OPP120_VDD1, 0xfa, 0x23),
VOLT_DATA_DEFINE(OMAP3630_VDD_MPU_OPP1G_UV, 
OMAP3630_CONTROL_FUSE_OPP1G_VDD1, 0xfa, 0x27),
VOLT_DATA_DEFINE(0, 0, 0, 0),
};
|

which makes sense based on the report. Is modyfing the numbers of 
"#define OMAP3630_VDD_MPU_OPP50_UV1012500" going to actually change the 
operating voltage at 300MHz?

Is there another place the parameters should be modified as well?

I know it may not be supported to tweak the kernel like this, but I am 
wondering at which level it is possible to modify these parameters.

Thanks in advance for any help,

Luis

--------------030608030701010800080807
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <span style="color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); display: inline !important;
      float: none;">Hi,</span>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">I am using the BBxM revC1,
      Ubuntu 12.04 with kernel 3.7.10-x10+.</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">&nbsp;</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">Does anyone know if it is
      possible to run the BBxM at a different voltage than the one
      stated?</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">For example running at
      lowest frequency (300MHz) the system reports:</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">
      <div style="margin: 0px; padding: 0px; border: 1px solid rgb(187,
        187, 187); vertical-align: baseline; background-color: rgb(250,
        250, 250); word-wrap: break-word;"><code style="margin: 0px;
          padding: 0px; border: 0px; vertical-align: baseline;">
          <div style="margin: 0px; padding: 0px; border: 0px;
            vertical-align: baseline;"><span style="margin: 0px;
              padding: 0px; border: 0px; vertical-align: baseline;"><font
                style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;" color="#000000">
                <div style="margin: 0px; padding: 0px; border: 0px;
                  vertical-align: baseline;">
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;">root@arm:/# cat
                    /sys/class/regulator/<wbr>regulator.4/name&nbsp;</div>
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;">vdd_mpu_iva</div>
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;"><br>
                  </div>
                  root@arm:/# cat /sys/class/regulator/<wbr>regulator.4/microvolts&nbsp;</div>
                <div style="margin: 0px; padding: 0px; border: 0px;
                  vertical-align: baseline;">1012500<br>
                  <br>
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;">root@arm:/# cat
                    /sys/class/regulator/<wbr>regulator.4/max_microvolts&nbsp;</div>
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;">1450000</div>
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;"><br>
                    <div style="margin: 0px; padding: 0px; border: 0px;
                      vertical-align: baseline;">root@arm:/# cat
                      /sys/class/regulator/<wbr>regulator.4/min_microvolts&nbsp;</div>
                    <div style="margin: 0px; padding: 0px; border: 0px;
                      vertical-align: baseline;">600000</div>
                  </div>
                  <div style="margin: 0px; padding: 0px; border: 0px;
                    vertical-align: baseline;"><br>
                  </div>
                </div>
              </font></span></div>
        </code></div>
      <br>
      Is it possible to change that "<span style="margin: 0px; padding:
        0px; border: 0px; vertical-align: baseline; background-color:
        rgb(250, 250, 250); color: rgb(0, 0, 0); font-family:
        monospace;">1012500</span>" to lets say "<span style="margin:
        0px; padding: 0px; border: 0px; vertical-align: baseline;
        background-color: rgb(250, 250, 250); color: rgb(0, 0, 0);
        font-family: monospace;">1000000</span>" or "<span
        style="margin: 0px; padding: 0px; border: 0px; vertical-align:
        baseline; background-color: rgb(250, 250, 250); color: rgb(0, 0,
        0); font-family: monospace;">900000</span>"?<b><span
          class="Apple-converted-space">&nbsp;</span>I am testing for
        reliability so I want to push the voltage as low as possible.</b></div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">According to the BBxM
      datasheet page 59 (7.7.5) VDD1 (vdd_mpu_iva) may be controlled
      using the SmartReflex controller (by I2C), configuring the output
      voltage of the TPS65950 between 0.6V and 1.45V in steps of 12.5mV
      (as stated before).&nbsp;</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">I know it may have to be
      done at Kernel cross-compiling stage, so digging into the kernel
      source code I found in &lt;kernel&gt;/arch/arm/mach-omap2/<wbr>omap3xxx_data.c&nbsp;<br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">Line:58</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">
      <div style="margin: 0px; padding: 0px; border: 1px solid rgb(187,
        187, 187); vertical-align: baseline; background-color: rgb(250,
        250, 250); word-wrap: break-word;"><code style="margin: 0px;
          padding: 0px; border: 0px; vertical-align: baseline;">
          <div style="margin: 0px; padding: 0px; border: 0px;
            vertical-align: baseline;"><font style="margin: 0px;
              padding: 0px; border: 0px; vertical-align: baseline;"
              color="#660066">
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  font-family: Arial, Helvetica, sans-serif;">/* 36xx */</span><br>
              </div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><br>
              </div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">/* VDD1 */</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><br>
              </div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">#define
                OMAP3630_VDD_MPU_OPP50_UV<span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>1012500</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">#define
                OMAP3630_VDD_MPU_OPP100_UV<span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>1200000</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">#define
                OMAP3630_VDD_MPU_OPP120_UV<span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>1325000</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">#define
                OMAP3630_VDD_MPU_OPP1G_UV<span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>1375000</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><br>
              </div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">struct omap_volt_data
                omap36xx_vddmpu_volt_data[] = {</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>VOLT_DATA_DEFINE(OMAP3630_VDD_<wbr>MPU_OPP50_UV,
                OMAP3630_CONTROL_FUSE_OPP50_<wbr>VDD1, 0xf4, 0x0c),</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>VOLT_DATA_DEFINE(OMAP3630_VDD_<wbr>MPU_OPP100_UV,
                OMAP3630_CONTROL_FUSE_OPP100_<wbr>VDD1, 0xf9, 0x16),</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>VOLT_DATA_DEFINE(OMAP3630_VDD_<wbr>MPU_OPP120_UV,
                OMAP3630_CONTROL_FUSE_OPP120_<wbr>VDD1, 0xfa, 0x23),</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>VOLT_DATA_DEFINE(OMAP3630_VDD_<wbr>MPU_OPP1G_UV,
                OMAP3630_CONTROL_FUSE_OPP1G_<wbr>VDD1, 0xfa, 0x27),</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;"><span style="margin: 0px;
                  padding: 0px; border: 0px; vertical-align: baseline;
                  white-space: pre;"> </span>VOLT_DATA_DEFINE(0, 0, 0,
                0),</div>
              <div style="margin: 0px; padding: 0px; border: 0px;
                vertical-align: baseline;">};</div>
            </font></div>
        </code></div>
      <br>
      which makes sense based on the report. Is modyfing the numbers of
      "<span style="margin: 0px; padding: 0px; border: 0px;
        vertical-align: baseline; color: rgb(102, 0, 102); font-family:
        monospace; background-color: rgb(250, 250, 250);">#define
        OMAP3630_VDD_MPU_OPP50_UV</span><span style="margin: 0px;
        padding: 0px; border: 0px; vertical-align: baseline; color:
        rgb(102, 0, 102); font-family: monospace; background-color:
        rgb(250, 250, 250); white-space: pre;"> </span><span
        style="margin: 0px; padding: 0px; border: 0px; vertical-align:
        baseline; color: rgb(102, 0, 102); font-family: monospace;
        background-color: rgb(250, 250, 250);">1012500</span>" going to
      actually change the operating voltage at 300MHz?</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">Is there another place the
      parameters should be modified as well?</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">I know it may not be
      supported to tweak the kernel like this, but I am wondering at
      which level it is possible to modify these parameters.</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">Thanks in advance for any
      help,</div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);"><br>
    </div>
    <div style="margin: 0px; padding: 0px; border: 0px; vertical-align:
      baseline; color: rgb(34, 34, 34); font-family: Arial, Helvetica,
      sans-serif; font-size: 13px; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      normal; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255);">Luis</div>
  </body>
</html>

--------------030608030701010800080807--
