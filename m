Return-Path: <meta-ti@emagii.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67659E00BEE; Mon,  9 Jun 2014 15:54:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [195.54.99.212 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from smtprelay-b21.telenor.se (smtprelay-b21.telenor.se
	[195.54.99.212])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F3E2E00BEB
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 15:54:25 -0700 (PDT)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 6C1B2D04D
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 00:54:23 +0200 (CEST)
X-SENDER-IP: [83.227.57.112]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AokEAOw5llNT4zlw/2dsb2JhbAANTINfqzoBAQEBAQEGmRABgSiBLwEBAoNFAQEBAQIBSS8BBQsLEwUJFggHCQMCAQIBNBEGDQEFAgEBiDYNCKlUoBAXhV2JDwcJhDgEhViUSYFCihCLMQ
X-IPAS-Result: AokEAOw5llNT4zlw/2dsb2JhbAANTINfqzoBAQEBAQEGmRABgSiBLwEBAoNFAQEBAQIBSS8BBQsLEwUJFggHCQMCAQIBNBEGDQEFAgEBiDYNCKlUoBAXhV2JDwcJhDgEhViUSYFCihCLMQ
X-IronPort-AV: E=Sophos;i="4.98,1005,1392159600"; 
	d="scan'208,217";a="699233259"
Received: from c-7039e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.112])
	by ipb5.telenor.se with ESMTP; 10 Jun 2014 00:54:22 +0200
Message-ID: <53963B12.2090906@emagii.com>
Date: Tue, 10 Jun 2014 00:54:10 +0200
From: Ulf Samuelsson <meta-ti@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com> <5394FEA0.1020602@emagii.com>
	<CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
In-Reply-To: <CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Mon, 09 Jun 2014 22:54:31 -0000
Content-Type: multipart/alternative;
	boundary="------------010300050600090705060605"

--------------010300050600090705060605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


2014-06-09 12:04, Diego Sueiro skrev:
> Ulf,
>
> On Sun, Jun 8, 2014 at 9:24 PM, Ulf Samuelsson <meta-ti@emagii.com 
> <mailto:meta-ti@emagii.com>> wrote:
>
>     Romber Nelson and some other people mention that the 3.12 kernel
>     used is not compatible with the advanced capes like LCDs.
>     Do I need to revert to the 3.8 kernel?
>
>
> Kernel 3.12 does not have cape manager capabilities, as far as I know.
> Did you tested it in a HDMI monitor/TV?
>
>
I have a 4,3" LCD display and HDMI connected.

"Romber Nelson" = Robert C Nelson.

I replaced the  meta-ti kernel with his patched 3.8.13 kernel.
If I understand this correctly, this has backported the Graphics 
acceleration.

Made sure that kernel-modules and libgles-omap3 are included in the build.
Also made sure that qtbase-5.1.1 is built with qtbaseexamples for testing.

I also enabled the LCD in the bootargs.

Now I get a splash screen and I can run the qt examples,
but only if I supply the linux frame buffer

"$ calculator"   fails, due not no X-windowa

Available platform plugins are: eglfs, linuxfb, minimal, minimalegl, 
offscreen.

"$ calculator -platform linuxfb" works, but is of course not accelerated.

"$ calculator -platform eglfs" fails.

Could not initialize egl display
EGL error
Aborted

I assume that this is either a faulty kernel, or lack of libraries.

My libraires related to EGL are:

root@beaglebone:/usr/lib# ls | grep EGL
libEGL.so
libEGL.so.1
libEGL.so.1.10
libEGL.so.1.10.2359475
libEGL_eglimage.so
libEGL_eglimage.so.1
libEGL_eglimage.so.1.10
libEGL_eglimage.so.1.10.2359475
libpvrPVR2D_BLITWSEGL.so
libpvrPVR2D_BLITWSEGL.so.1
libpvrPVR2D_BLITWSEGL.so.1.10
libpvrPVR2D_BLITWSEGL.so.1.10.2359475
libpvrPVR2D_FLIPWSEGL.so
libpvrPVR2D_FLIPWSEGL.so.1
libpvrPVR2D_FLIPWSEGL.so.1.10
libpvrPVR2D_FLIPWSEGL.so.1.10.2359475
libpvrPVR2D_FRONTWSEGL.so
libpvrPVR2D_FRONTWSEGL.so.1
libpvrPVR2D_FRONTWSEGL.so.1.10
libpvrPVR2D_FRONTWSEGL.so.1.10.2359475
libpvrPVR2D_LINUXFBWSEGL.so
libpvrPVR2D_LINUXFBWSEGL.so.1
libpvrPVR2D_LINUXFBWSEGL.so.1.10
libpvrPVR2D_LINUXFBWSEGL.so.1.10.2359475

Any other library, I should be looking for?

-----------------------------------------------------------------------

The kernel options have set
CONFIG_DRM_TILCDC=y
CONFIG_DRM is not set
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y
CONFIG_FB_DA8XX=y
CONFIG_FB_ST7735=y
FB_BOTH_ENDIAN=y

CONFIG_OMAP2_DSS_DPI=y
CONFIG_OMAP2_DSS_RFBI=y
CONFIG_OMAP2_DSS_VENC=y
CONFIG_OMAP4_DSS_HDMI=y
CONFIG_OMAP2_DSS_SDI=y
CONFIG_OMAP2_DSS_DSL=y

CONFIG_FB_OMAP2_DEBUG_SUPPORT=y


CONFIG_FB_OMAP2_NUM_FBS=3

CONFIG_PANEL_GENERIC_DPI=m
CONFIG_PANEL_SHARP_LS037V7DW01=m
CONFIG_PANEL_NEC_NL8048HL11_01B=m

CONFIG_PANEL_TAAL=y
CONFIG_PANEL_TPO_TD043MTEA1=y
CONFIG_PANEL_ACX565AKM=y
CONFIG_LCD_ILI9320=y


CONFIG_LCD_PLATFORM=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
FONT_MINI_4x6=y
LOGO_LINUX_MONO=y
LOGO_LINUX_VGA16=y
LOGO_LINUX_CLUT224=y

Checked the 3.12 meta-ti kernel and it does not seem to have a lot of 
extra config options.

Should I focus on the kernel or the libraries to get an EGL display?
---------------------------------------------------------------------

BTW: What is the reason that there is no cape support

1.It is considered a bad idea, and rejected?
2.Beaglebone specific, and thus of no interest to anyone with real money?
3.Noone bothered to submit to mainstream?
4.There is another API in the works, which will allow similar functionality.
5.Other reason?

Seems that every system on a chip with programmable I/O would need 
something similar.

Is there any other easy way to get the LCD running.
Customized device-tree fille?

Any such file available off the shelf?


BR
Ulf Samuelsson

> Regrads,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br 
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/


--------------010300050600090705060605
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">2014-06-09 12:04, Diego Sueiro skrev:<br>
    </div>
    <blockquote
cite="mid:CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ulf,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Sun, Jun 8, 2014 at 9:24 PM, Ulf
            Samuelsson <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:meta-ti@emagii.com" target="_blank">meta-ti@emagii.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4eg" class="a3s" style="overflow:hidden">Romber
                Nelson and some other people mention that the 3.12
                kernel used is not compatible with the advanced capes
                like LCDs.<br>
                Do I need to revert to the 3.8 kernel?</div>
            </blockquote>
          </div>
          <div class="gmail_extra"><br>
          </div>
          Kernel 3.12 does not have cape manager capabilities, as far as
          I know.</div>
        <div class="gmail_extra">Did you tested it in a HDMI monitor/TV?<br>
          <br>
          <br clear="all">
        </div>
      </div>
    </blockquote>
    I have a 4,3" LCD display and HDMI connected.<br>
    <br>
    "Romber Nelson" = Robert C Nelson.<br>
    <br>
    I replaced the&nbsp; meta-ti kernel with his patched 3.8.13 kernel.<br>
    If I understand this correctly, this has backported the Graphics
    acceleration.<br>
    <br>
    Made sure that kernel-modules and libgles-omap3 are included in the
    build.<br>
    Also made sure that qtbase-5.1.1 is built with qtbaseexamples for
    testing.<br>
    <br>
    I also enabled the LCD in the bootargs.<br>
    <br>
    Now I get a splash screen and I can run the qt examples,<br>
    but only if I supply the linux frame buffer<br>
    <br>
    "$ calculator"&nbsp;&nbsp; fails, due not no X-windowa<br>
    <br>
    Available platform plugins are: eglfs, linuxfb, minimal, minimalegl,
    offscreen.<br>
    <br>
    "$ calculator -platform linuxfb" works, but is of course not
    accelerated.<br>
    <br>
    "$ calculator -platform eglfs" fails.<br>
    <br>
    Could not initialize egl display<br>
    EGL error<br>
    Aborted<br>
    <br>
    I assume that this is either a faulty kernel, or lack of libraries.<br>
    <br>
    My libraires related to EGL are:<br>
    <br>
    root@beaglebone:/usr/lib# ls | grep EGL<br>
    libEGL.so<br>
    libEGL.so.1<br>
    libEGL.so.1.10<br>
    libEGL.so.1.10.2359475<br>
    libEGL_eglimage.so<br>
    libEGL_eglimage.so.1<br>
    libEGL_eglimage.so.1.10<br>
    libEGL_eglimage.so.1.10.2359475<br>
    libpvrPVR2D_BLITWSEGL.so<br>
    libpvrPVR2D_BLITWSEGL.so.1<br>
    libpvrPVR2D_BLITWSEGL.so.1.10<br>
    libpvrPVR2D_BLITWSEGL.so.1.10.2359475<br>
    libpvrPVR2D_FLIPWSEGL.so<br>
    libpvrPVR2D_FLIPWSEGL.so.1<br>
    libpvrPVR2D_FLIPWSEGL.so.1.10<br>
    libpvrPVR2D_FLIPWSEGL.so.1.10.2359475<br>
    libpvrPVR2D_FRONTWSEGL.so<br>
    libpvrPVR2D_FRONTWSEGL.so.1<br>
    libpvrPVR2D_FRONTWSEGL.so.1.10<br>
    libpvrPVR2D_FRONTWSEGL.so.1.10.2359475<br>
    libpvrPVR2D_LINUXFBWSEGL.so<br>
    libpvrPVR2D_LINUXFBWSEGL.so.1<br>
    libpvrPVR2D_LINUXFBWSEGL.so.1.10<br>
    libpvrPVR2D_LINUXFBWSEGL.so.1.10.2359475<br>
    <br>
    Any other library, I should be looking for?<br>
    <br>
-----------------------------------------------------------------------<br>
    <br>
    The kernel options have set<br>
    CONFIG_DRM_TILCDC=y<br>
    CONFIG_DRM is not set<br>
    CONFIG_FIRMWARE_EDID=y<br>
    CONFIG_FB_MODE_HELPERS=y<br>
    CONFIG_FB_TILEBLITTING=y<br>
    CONFIG_FB_DA8XX=y<br>
    CONFIG_FB_ST7735=y<br>
    FB_BOTH_ENDIAN=y<br>
    <br>
    CONFIG_OMAP2_DSS_DPI=y<br>
    CONFIG_OMAP2_DSS_RFBI=y<br>
    CONFIG_OMAP2_DSS_VENC=y<br>
    CONFIG_OMAP4_DSS_HDMI=y<br>
    CONFIG_OMAP2_DSS_SDI=y<br>
    CONFIG_OMAP2_DSS_DSL=y<br>
    <br>
    CONFIG_FB_OMAP2_DEBUG_SUPPORT=y<br>
    <br>
    <br>
    CONFIG_FB_OMAP2_NUM_FBS=3<br>
    <br>
    CONFIG_PANEL_GENERIC_DPI=m<br>
    CONFIG_PANEL_SHARP_LS037V7DW01=m<br>
    CONFIG_PANEL_NEC_NL8048HL11_01B=m<br>
    <br>
    CONFIG_PANEL_TAAL=y<br>
    CONFIG_PANEL_TPO_TD043MTEA1=y<br>
    CONFIG_PANEL_ACX565AKM=y<br>
    CONFIG_LCD_ILI9320=y<br>
    <br>
    <br>
    CONFIG_LCD_PLATFORM=y<br>
    CONFIG_FRAMEBUFFER_CONSOLE=y<br>
    CONFIG_FONTS=y<br>
    CONFIG_FONT_8x8=y<br>
    CONFIG_FONT_8x16=y<br>
    FONT_MINI_4x6=y<br>
    LOGO_LINUX_MONO=y<br>
    LOGO_LINUX_VGA16=y<br>
    LOGO_LINUX_CLUT224=y<br>
    <br>
    Checked the 3.12 meta-ti kernel and it does not seem to have a lot
    of extra config options.<br>
    <br>
    Should I focus on the kernel or the libraries to get an EGL display?<br>
---------------------------------------------------------------------<br>
    <br>
    BTW: What is the reason that there is no cape support<br>
    <br>
    1.It is considered a bad idea, and rejected?<br>
    2.Beaglebone specific, and thus of no interest to anyone with real
    money?<br>
    3.Noone bothered to submit to mainstream?<br>
    4.There is another API in the works, which will allow similar
    functionality.<br>
    5.Other reason?<br>
    <br>
    Seems that every system on a chip with programmable I/O would need
    something similar.<br>
    <br>
    Is there any other easy way to get the LCD running. <br>
    Customized device-tree fille?<br>
    <br>
    Any such file available off the shelf?<br>
    <br>
    <br>
    BR<br>
    Ulf Samuelsson<br>
    <br>
    <blockquote
cite="mid:CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div>
            <div dir="ltr">
              <div>Regrads,</div>
              <div><br>
              </div>
              --<br>
              *dS<br>
              Diego Sueiro<br>
              <br>
              Administrador do Embarcados<br>
              <a moz-do-not-send="true"
href="http://www.embarcados.com.br/?utm_source=assinatura_diego&amp;utm_medium=e-mail&amp;utm_campaign=Assinatura%20Email%20Diego"
                target="_blank">www.embarcados.com.br</a><br>
              <br>
              /*long live rock 'n roll*/<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010300050600090705060605--
