Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5752E0080D; Thu, 27 Oct 2016 09:43:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7184EE007D3
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 09:43:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9RGhKmq026051;
	Thu, 27 Oct 2016 11:43:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RGhKJf004424;
	Thu, 27 Oct 2016 11:43:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Oct 2016 11:43:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RGhJps023583;
	Thu, 27 Oct 2016 11:43:20 -0500
Date: Thu, 27 Oct 2016 12:43:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: como comodore <comocomodore@gmail.com>
Message-ID: <20161027164319.GG12745@edge>
References: <CAOsSiRT0U4=MF1A5anqsjV8z9+_8OG+eT8cs6EmjKdendB7D5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOsSiRT0U4=MF1A5anqsjV8z9+_8OG+eT8cs6EmjKdendB7D5Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EGLFS gstreamer video extremely slow
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
X-List-Received-Date: Thu, 27 Oct 2016 16:43:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Oct 22, 2016 at 11:31:10AM +0200, como comodore wrote:
> Hello,
> 
> I've just build a new system for Beaglebone Black with Yocto, meta-ti and
> meta-qt5.
> SGX drivers are loaded, Qt5 GLES2 examples are running fine with -platform
> eglfs.
> The only problem is that video files are extremely slow in eglfs (under 1
> fps). I've opened some .avi file in Media Player Example from Qt and ran it
> with GST_DEBUG=2 environment variable.

Need more detailed info about gstreamer you are using.


> Here is the output:
> 
> xcb_connection_has_error() returned true
> 
> 0:00:11.039354959 670 0x4be00 WARN pulse
> pulsesink.c:615:gst_pulseringbuffer_open_device:<audiosink-actual-sink-pulse>
> error: Failed to connect: Connection refused
> 
> 0:00:11.071349168 670 0x4be00 WARN basesrc
> gstbasesrc.c:3489:gst_base_src_start_complete:<source> pad not activated yet
> 
> 0:00:11.077873501 670 0x4be00 WARN basesrc
> gstbasesrc.c:3489:gst_base_src_start_complete:<source> pad not activated yet
> 
> 0:00:11.159736793 670 0x1c6290 WARN alsa conf.c:4817:snd_config_expand:
> alsalib error: Unknown parameters {AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}
> 
> 0:00:11.160655293 670 0x1c6290 WARN alsa pcm.c:2450:snd_pcm_open_noupdate:
> alsalib error: Unknown PCM default:{AES0 0x02 AES1 0x82 AES2 0x00 AES3 0x02}
> 
> 0:00:11.330111876 670 0xb1512ac0 ERROR h264parse
> gsth264parse.c:2444:gst_h264_parse_set_caps: video/x-h264 caps with
> codec_data but no stream-format=avc
> 
> 0:00:15.296070960 670 0xb1705830 WARN basesink
> gstbasesink.c:2854:gst_base_sink_is_too_late:<qgstvideorenderersink0>
> warning: A lot of buffers are being dropped.
> 
> 0:00:15.296832168 670 0xb1705830 WARN basesink
> gstbasesink.c:2854:gst_base_sink_is_too_late:<qgstvideorenderersink0>
> warning: There may be a timestamping problem, or this computer is too slow.
> 
> Warning: "A lot of buffers are being dropped."
> 
> Sound is playing fine. All GStreamer1.0 packages are installed. Any ideas
> how to fix tis issue or playing video is not supported in EGLFS?
> 
> *gfx_check.sh *output*:*
> 
> WSEGL settings
> [default]
> WindowSystem=libpvrDRMWSEGL.so
> DisableHWTQTextureUpload=1
> DefaultPixelFormat=RGB565
> ------
> ARM CPU information
> processor    : 0
> model name    : ARMv7 Processor rev 2 (v7l)
> BogoMIPS    : 298.84
> Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
> CPU implementer    : 0x41
> CPU architecture: 7
> CPU variant    : 0x3
> CPU part    : 0xc08
> CPU revision    : 2
> 
> Hardware    : Generic AM33XX (Flattened Device Tree)
> Revision    : 0000
> Serial        : 0000000000000000
> ------
> SGX driver information
> Version SGX_DDK sgxddk MAIN@3699939 (release) omap_linux
> System Version String: SGX revision = 125
> ------
> Framebuffer settings
> 
> mode "1280x720"
>     geometry 1280 720 1280 720 16
>     timings 0 0 0 0 0 0 0
>     accel true
>     rgba 5/11,6/5,5/0,0/0
> endmode
> 
> Frame buffer device information:
>     Name        :
>     Address     : 0x9e900000
>     Size        : 1843200
>     Type        : PACKED PIXELS
>     Visual      : TRUECOLOR
>     XPanStep    : 1
>     YPanStep    : 1
>     YWrapStep   : 0
>     LineLength  : 2560
>     Accelerator : No
> ------
> Rotation settings
> 0
> ------
> Kernel Module information
> Module                  Size  Used by
> bluetooth             328754  4
> bc_example              7326  0
> snd_usb_audio         139564  0
> snd_hwdep               6043  1 snd_usb_audio
> snd_usbmidi_lib        20376  1 snd_usb_audio
> snd_rawmidi            22968  1 snd_usbmidi_lib
> usbtouchscreen          5791  0
> usbhid                 20953  0
> musb_dsps               8235  0
> musb_hdrc              42682  1 musb_dsps
> usbcore               194528  5
> snd_usb_audio,musb_hdrc,usbtouchscreen,snd_usbmidi_lib,usbhid
> pru_rproc              11646  0
> pruss_intc              7163  1 pru_rproc
> ecb                     1909  0
> sha256_generic          9503  0
> hmac                    2735  0
> md5                     1897  0
> sha1_generic            2557  0
> snd_soc_simple_card     7648  0
> sha1_arm_neon           6261  0
> sha1_arm                3862  1 sha1_arm_neon
> wkup_m3_ipc             7651  0
> pvrsrvkm              403200  1 bc_example
> wkup_m3_rproc           3599  1
> pruss                  10892  1 pru_rproc
> omap_aes_driver        19163  0
> omap_sham              21513  0
> remoteproc             26989  4 pruss,wkup_m3_rproc,pru_rproc,wkup_m3_ipc
> virtio                  7678  1 remoteproc
> virtio_ring            12175  1 remoteproc
> omap_rng                4482  0
> rng_core                7685  1 omap_rng
> musb_am335x             1426  0
> omap_wdt                4634  0
> ------
> Boot settings
> console=ttyO0,115200n8 consoleblank=0 root=PARTUUID=ac45843e-02 rw
> rootfstype=ext4 rootwait
> ------
> Linux Kernel version
> Linux beaglebone 4.4.23-g4cd9d100e6 #2 PREEMPT Thu Oct 20 22:23:28 CEST
> 2016 armv7l armv7l armv7l GNU/Linux
> 
> Thanks,
> Comodore

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


