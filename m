Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF0EEE01206
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 13:10:52 -0700 (PDT)
Received: from [192.168.0.2] (host86-133-47-66.range86-133.btcentralplus.com
	[86.133.47.66]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 7C7279ADE
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2012 21:10:51 +0100 (BST)
Message-ID: <4F99ABC7.9080807@r-finger.com>
Date: Thu, 26 Apr 2012 21:10:47 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120329 Icedove/10.0.3
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: egl on beagleboard xM
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2012 20:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I am trying to get native egl (i.e., without X) working on Beagleboard
xM, but without much success. I am using libgles-omap3 (4.05.00.03) the
kernel(s) and sgx drivers from meta-ti master; everything appears to
start fine (i.e., no errors reported from pvr-init or dmesg), but trying
run any of the gles tests / demos gives:

  'eglInitialize' returned egl error 'EGL_BAD_ALLOC' (0x3003)

I have tried both linux-omap 2.6.39 and linux 3.0.8, with same results.

Any pointers to what the problem might be would be much appreciated,

Tomas


kernel command line:

console=ttyO2,115200n8 vram=48M mpurate=auto
omapfb.mode=dvi:1280x720MR-16@60 omapfb.debug=y omapdss.def_disp=dvi
root=/dev/mmcblk0p2 rw rootfstype=ext3 rootwait

Also tried 1024x768MR-16@60, and different vram sizes, without success.

# lsmod

Module                  Size  Used by
bufferclass_ti          4696  0
omaplfb                11014  0
pvrsrvkm              142463  2 bufferclass_ti,omaplfb
...

# cat /proc/pvr/nodes

Registered nodes
Addr     Type     Class    Index Ref pvDev     Size Res
db42eb00 ?9       buffer      2   1  da43ba00   28    (null)
db42ed40 ?9       display     1   1  db77a300   52    (null)
db42eec0 ?7       3D          0   1  db57c000    0  db572680


# fbset -i

mode "1280x720-60"
    # D: 64.000 MHz, H: 44.444 kHz, V: 59.979Hz
    geometry 1280 720 1280 720 16
    timings 15625 80 48 3 13 32 5
    rgba 5/11,6/5,5/0,0/0
endmode

Frame buffer device information:
    Name        :omapfb
    Address     : 0x9d000000
    Size        : 1843200
    Type        : PACKED PIXELS
    Visual      : TRUECOLOR
    XPanStep    : 1
    YPanStep    : 1
    YWrapStep   : 0
    LineLength  : 2560


