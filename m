Return-Path: <meta-ti@emagii.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76F10E00BEC; Mon,  9 Jun 2014 23:36:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [195.54.99.196 listed in list.dnswl.org]
Received: from smtprelay-h21.telenor.se (smtprelay-h21.telenor.se
	[195.54.99.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EA1AE00BE3
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 23:36:42 -0700 (PDT)
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id BAC0FC48E
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 08:36:40 +0200 (CEST)
X-SENDER-IP: [83.227.57.112]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AloyAKumllNT4zlwPGdsb2JhbAANTINfq0ABAQEBAQEGkTkbhzwBgSIEAQEBAThvAQECg0UBAQEBAgEBAQE1ESUKARALEwUJFggHCQMCAQIBFQEbAxEGDQEFAgEBiDYNCKosoDEXhV2JDweEQQEDhGACklmCZoFCihCLMQ
X-IPAS-Result: AloyAKumllNT4zlwPGdsb2JhbAANTINfq0ABAQEBAQEGkTkbhzwBgSIEAQEBAThvAQECg0UBAQEBAgEBAQE1ESUKARALEwUJFggHCQMCAQIBFQEbAxEGDQEFAgEBiDYNCKosoDEXhV2JDweEQQEDhGACklmCZoFCihCLMQ
X-IronPort-AV: E=Sophos;i="4.98,1007,1392159600"; d="scan'208";a="596682387"
Received: from c-7039e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.112])
	by ipb4.telenor.se with ESMTP; 10 Jun 2014 08:36:40 +0200
Message-ID: <5396A777.1070305@emagii.com>
Date: Tue, 10 Jun 2014 08:36:39 +0200
From: Ulf Samuelsson <meta-ti@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com> <5394FEA0.1020602@emagii.com>
	<CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
	<53963B12.2090906@emagii.com> <20140610003527.GI18034@edge>
In-Reply-To: <20140610003527.GI18034@edge>
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
X-List-Received-Date: Tue, 10 Jun 2014 06:36:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


2014-06-10 02:35, Denys Dmytriyenko skrev:
> On Tue, Jun 10, 2014 at 12:54:10AM +0200, Ulf Samuelsson wrote:
>> 2014-06-09 12:04, Diego Sueiro skrev:
>>> Ulf,
>>>
>>> On Sun, Jun 8, 2014 at 9:24 PM, Ulf Samuelsson <meta-ti@emagii.com
>>> <mailto:meta-ti@emagii.com>> wrote:
>>>
>>>     Romber Nelson and some other people mention that the 3.12 kernel
>>>     used is not compatible with the advanced capes like LCDs.
>>>     Do I need to revert to the 3.8 kernel?
>>>
>>>
>>> Kernel 3.12 does not have cape manager capabilities, as far as I know.
>>> Did you tested it in a HDMI monitor/TV?
>>>
>>>
>> I have a 4,3" LCD display and HDMI connected.
>>
>> "Romber Nelson" = Robert C Nelson.
>>
>> I replaced the  meta-ti kernel with his patched 3.8.13 kernel.
>> If I understand this correctly, this has backported the Graphics
>> acceleration.
>>
>> Made sure that kernel-modules and libgles-omap3 are included in the build.
>> Also made sure that qtbase-5.1.1 is built with qtbaseexamples for testing.
>>
>> I also enabled the LCD in the bootargs.
>>
>> Now I get a splash screen and I can run the qt examples,
>> but only if I supply the linux frame buffer
>>
>> "$ calculator"   fails, due not no X-windowa
>>
>> Available platform plugins are: eglfs, linuxfb, minimal, minimalegl,
>> offscreen.
>>
>> "$ calculator -platform linuxfb" works, but is of course not accelerated.
>>
>> "$ calculator -platform eglfs" fails.
>>
>> Could not initialize egl display
>> EGL error
>> Aborted
> IIRC, there were some additional patches for libgles-omap3 and Qt5 in
> meta-arago... I don't remember the version of Qt5 when I played with it and
> got it working - it was either 5.1.1 or 5.2...
>
meta-arago (dora) has 5.1.1
master has 5.2.0

meta-qt5 uses 5.2.1



>> I assume that this is either a faulty kernel, or lack of libraries.
>>
>> My libraires related to EGL are:
>>
>> root@beaglebone:/usr/lib# ls | grep EGL
>> libEGL.so
>> libEGL.so.1
>> libEGL.so.1.10
>> libEGL.so.1.10.2359475
>> libEGL_eglimage.so
>> libEGL_eglimage.so.1
>> libEGL_eglimage.so.1.10
>> libEGL_eglimage.so.1.10.2359475
>> libpvrPVR2D_BLITWSEGL.so
>> libpvrPVR2D_BLITWSEGL.so.1
>> libpvrPVR2D_BLITWSEGL.so.1.10
>> libpvrPVR2D_BLITWSEGL.so.1.10.2359475
>> libpvrPVR2D_FLIPWSEGL.so
>> libpvrPVR2D_FLIPWSEGL.so.1
>> libpvrPVR2D_FLIPWSEGL.so.1.10
>> libpvrPVR2D_FLIPWSEGL.so.1.10.2359475
>> libpvrPVR2D_FRONTWSEGL.so
>> libpvrPVR2D_FRONTWSEGL.so.1
>> libpvrPVR2D_FRONTWSEGL.so.1.10
>> libpvrPVR2D_FRONTWSEGL.so.1.10.2359475
>> libpvrPVR2D_LINUXFBWSEGL.so
>> libpvrPVR2D_LINUXFBWSEGL.so.1
>> libpvrPVR2D_LINUXFBWSEGL.so.1.10
>> libpvrPVR2D_LINUXFBWSEGL.so.1.10.2359475
>>
>> Any other library, I should be looking for?
>>
>> -----------------------------------------------------------------------
>>
>> The kernel options have set
>> CONFIG_DRM_TILCDC=y
>> CONFIG_DRM is not set
>> CONFIG_FIRMWARE_EDID=y
>> CONFIG_FB_MODE_HELPERS=y
>> CONFIG_FB_TILEBLITTING=y
>> CONFIG_FB_DA8XX=y
>> CONFIG_FB_ST7735=y
>> FB_BOTH_ENDIAN=y
>>
>> CONFIG_OMAP2_DSS_DPI=y
>> CONFIG_OMAP2_DSS_RFBI=y
>> CONFIG_OMAP2_DSS_VENC=y
>> CONFIG_OMAP4_DSS_HDMI=y
>> CONFIG_OMAP2_DSS_SDI=y
>> CONFIG_OMAP2_DSS_DSL=y
>>
>> CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
>>
>>
>> CONFIG_FB_OMAP2_NUM_FBS=3
>>
>> CONFIG_PANEL_GENERIC_DPI=m
>> CONFIG_PANEL_SHARP_LS037V7DW01=m
>> CONFIG_PANEL_NEC_NL8048HL11_01B=m
>>
>> CONFIG_PANEL_TAAL=y
>> CONFIG_PANEL_TPO_TD043MTEA1=y
>> CONFIG_PANEL_ACX565AKM=y
>> CONFIG_LCD_ILI9320=y
>>
>>
>> CONFIG_LCD_PLATFORM=y
>> CONFIG_FRAMEBUFFER_CONSOLE=y
>> CONFIG_FONTS=y
>> CONFIG_FONT_8x8=y
>> CONFIG_FONT_8x16=y
>> FONT_MINI_4x6=y
>> LOGO_LINUX_MONO=y
>> LOGO_LINUX_VGA16=y
>> LOGO_LINUX_CLUT224=y
>>
>> Checked the 3.12 meta-ti kernel and it does not seem to have a lot
>> of extra config options.
>>
>> Should I focus on the kernel or the libraries to get an EGL display?
>> ---------------------------------------------------------------------
>>
>> BTW: What is the reason that there is no cape support
>>
>> 1.It is considered a bad idea, and rejected?
>> 2.Beaglebone specific, and thus of no interest to anyone with real money?
>> 3.Noone bothered to submit to mainstream?
>> 4.There is another API in the works, which will allow similar functionality.
>> 5.Other reason?
> 5. Other reason - it's been in the works for some time now, but is still not
> merged upstream, as it's not trivial. You can google for capebus, capemgr and
> devtree overlays for the latest set of patches...
Thanks!

Wouldn't a customized device-tree work?
BR
Ulf

>
>> Seems that every system on a chip with programmable I/O would need
>> something similar.
>>
>> Is there any other easy way to get the LCD running.
>> Customized device-tree fille?
>>
>> Any such file available off the shelf?
>>
>>
>> BR
>> Ulf Samuelsson
>>
>>> Regrads,
>>>
>>> --
>>> *dS
>>> Diego Sueiro
>>>
>>> Administrador do Embarcados
>>> www.embarcados.com.br <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>>>
>>> /*long live rock 'n roll*/
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


