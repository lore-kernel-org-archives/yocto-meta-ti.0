Return-Path: <simon.pelletiert@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BD12E00D7E; Mon, 10 Oct 2016 13:27:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AC_DIV_BONANZA,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (simon.pelletiert[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.0 AC_DIV_BONANZA RAW: Too many divs in a row... spammy template
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.174 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 195DFE00D77
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 13:27:00 -0700 (PDT)
Received: by mail-qk0-f174.google.com with SMTP id z190so1389192qkc.2
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T+i+Fvjsadye2l+5E6LhsT6OsjnJHhxQWlgziZcP45A=;
	b=LKgDVK3WVylELSj5KWlz/1Nzhb+SYj1JQjKGuYD4+K1IuWy2ZFYWurPH8E0Dj/uxTh
	6/FdVmODDmxfVTWRN9NprZ7VffLWLie27acmnwJYQjT3RDYxKKZ51GqlP4m6xblwYj7V
	1AQfljRcv7FU2YzgGAzkmThFXYfqIbI6hRx1G2cfiC0e5uBA+hg2Qh4fGDvPkT1duF8F
	GKaf3fCSRYmbBjCIUIr5G5JF4rr9UX+cgyGnZgBjgrRkajONhWe+R3/LZCUIYM/L34Ez
	Lag8/mxh9jVLbH32Qetcj5sNw4hlXd54VPar6mqXfYIg67zFtcDHmMjxncUsL4AyrFOp
	9MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T+i+Fvjsadye2l+5E6LhsT6OsjnJHhxQWlgziZcP45A=;
	b=A6y6SxAGM+vC8pQ4/OtxK3aO70Gi05Zazvm0yTK2Bbz8gkdeeMFGZ+4AnBW/KfReBF
	EX3WQLMvnOxFE8yaykY4HRqTFquyuZ0ZkR1ccTpJp+wOy2awD4MED8aNwv5gE6+DZyGI
	SUdzn9MSeDkALGTudBGhIj8W2I7uDuHfaILgzif1pX2JeE/j56d/KOMiZNkVy1wDbZIy
	6MirnPVym+MRWVwkgSNHAWNy9MQE8n96E3Aikn12fARJZ9ketwQsbvd/CVs9UP+p93t7
	I00n088oyKiH08LJOI2xDk0j49mWBUEnHIGq1jcpopGw81OU/rWRyzyWAAs2uffvnE/M
	StVA==
X-Gm-Message-State: AA6/9RlIQyrU867cLEPaQIFy0hyNeKEmJzxq6KP7a5FBwoQYW2Bg+ZqfrGppcMQae9v+k89DHgxZ7HF3yDRDGQ==
X-Received: by 10.55.212.221 with SMTP id s90mr50284qks.169.1476131220051;
	Mon, 10 Oct 2016 13:27:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.164 with HTTP; Mon, 10 Oct 2016 13:26:59 -0700 (PDT)
In-Reply-To: <20161010142749.GR12745@edge>
References: <CAMUfapSLsRQiC=ugzRWLJHqFS-PzV9evCx0CQtWRqzdO=vC6GA@mail.gmail.com>
	<009C030982313E4589C6BC55FBF1E82A142D6938@DFLE09.ent.ti.com>
	<20161010142749.GR12745@edge>
From: Simon Pelletier-Thibault <simon.pelletiert@gmail.com>
Date: Mon, 10 Oct 2016 16:26:59 -0400
Message-ID: <CAMUfapRgck57qr2oyGJb02qiUmyU+6nart61uYSQiFtKo6mDcQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black - ti-sgx-ddk not working on yocto Krogoth, what is missing
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
X-List-Received-Date: Mon, 10 Oct 2016 20:27:02 -0000
Content-Type: multipart/alternative; boundary=001a1149ae0c035d45053e88955c

--001a1149ae0c035d45053e88955c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Eric, Denys

Thank you for answering.

I tried the following:
root@beaglebone:~# gles1test1
PVR:(Error): WSEGL_CreateWindowDrawable: Couldn't set CRTC: Invalid
argument [0, ]
'eglCreateWindowSurface' returned egl error 'EGL_BAD_ALLOC' (0x3003)
root@beaglebone:~# gles2test1
--------------------- started ---------------------
PVR:(Error): WSEGL_CreateWindowDrawable: Couldn't set CRTC: Invalid
argument [0, ]
'eglCreateWindowSurface' returned egl error 'EGL_BAD_ALLOC' (0x3003)

I also try other configurations, like core-image-weston. After "adjusting"
mesa so it won't install gbm, weston won't boot and I still errors.

here the weston output:
starting with no config
Loding module/usr/lib/weston/drm-backend.so
output repaint windows is 7 ms maximun
initilizing drm backend
using /dev/dri/card0
Loading module /usr/lib/weston/gl-rendered.so
...
loaded module: found gbm_pvr.so
found valid GBM backend : gbm_pvr.so
warning no EGL_EXT_platform_base support of specific platform; failling
back to eglGetDisplay
failed to choose EGL config
failed to initialize egl
fatal: failed to create compositor backend


I think the problem is around the drm thing. I'm not an expert but:
when I look at /dev/dri/*, I see 2 card ( as if there is 2 drm driver)
root@beaglebone:~# ls -lsa /dev/dri/
     0 drwxr-xr-x    2 root     root           120 Jan  1  1970 .
     0 drwxr-xr-x   11 root     root         13160 Oct  6 04:22 ..
     0 crw-rw----    1 root     video     226,   0 Jan  1  1970 card0
     0 crw-rw----    1 root     video     226,   1 Jan  1  1970 card1
     0 crw-rw----    1 root     video     226,  64 Jan  1  1970 controlD64
     0 crw-rw----    1 root     video     226, 128 Jan  1  1970 renderD128


also
root@beaglebone:~# ls -lsa /sys/class/drm/card0/device/driver
     0 lrwxrwxrwx    1 root     root             0 Oct  6 04:31
/sys/class/drm/card0/device/driver ->
../../../../bus/platform/drivers/tilcdc
root@beaglebone:~# ls -lsa /sys/class/drm/card1/device/driver
     0 lrwxrwxrwx    1 root     root             0 Oct  6 04:35
/sys/class/drm/card1/device/driver ->
../../../../bus/platform/drivers/pvrsrvkm

1. So it sound that there is 2 drm drivers is it normal?
2. Should I change the device three to remove tilcdc, so the only drm
driver will be pvrsrvkm?
3. Is there something to do to ensure libdrm use the SGX driver?


On Mon, Oct 10, 2016 at 10:27 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> FYI, that is not part of meta-ti - both kmscube and SGX demos are part of
> meta-arago application layer, not meta-ti BSP layer.
>
> --
> Denys
>
>
> On Mon, Oct 10, 2016 at 02:19:22PM +0000, Ruei, Eric wrote:
> > Hi, Simon:
> >
> > Most of the SGX test programs including sgx_init_test will not work
> anymore because we have switched to DRM-based EGL Window Systems.
> > Have you tried other SGX test programs at the file system?
> >
> > -          Weston?
> >
> > -          QT programs ion top of Weston?
> >
> > -          Without Weston
> >
> > o   Kmscube
> >
> > o   /usr/bin/SGX/demos/Raw/ OGLES2ChameleonMan
> >
> > o   =E2=80=A6
> >
> > Best regards,
> >
> > Eric
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@
> yoctoproject.org] On Behalf Of Simon Pelletier-Thibault
> > Sent: Friday, October 07, 2016 9:49 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] BeagleBone Black - ti-sgx-ddk not working on yocto
> Krogoth, what is missing
> >
> > Hi,
> > I'm trying to use sgx driver for EGL application on BeagleBone Black. I
> build a minimal image to test it and it is not working.
> > I got this:
> > root@beaglebone:~# sgx_init_test
> > ----------------------- Start -----------------------
> > Try calling PVRSRVConnect with an invalid argument:
> > PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]
> > PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]
> >  OK
> > Call PVRSRVConnect with a valid argument:
> >  OK
> > Try calling PVRSRVEnumerateDevices with invalid puiNumDevices:
> > PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]
> >  OK
> > Get number of devices from PVRSRVEnumerateDevices:
> >  OK
> > .... Reported 1 devices
> > .... Device Number  | Device Type
> >             0000    | PVRSRV_DEVICE_ID_SGX
> > Attempt to acquire device 0:
> >  OK
> > Getting SGX Client info
> >  OK
> > .... ui32ProcessID:266
> > Display Class API: enumerate devices
> >  OK
> > PVRSRVEnumerateDeviceClass() returns 0 display device(s)
> >  FAIL - PVRSRV_ERROR_NO_DC_DEVICES_FOUND
> > -----
> > Here my configuration:
> > bblayes.conf:
> > POKY_BBLAYERS_CONF_VERSION =3D "2"
> >
> > BBPATH =3D "${TOPDIR}"
> > BBFILES ?=3D ""
> >
> > BBLAYERS ?=3D " \
> >   /path/poky2.1/meta \
> >   /path/poky2.1/meta-poky \
> >   /path/meta-ti2 \
> >   "
> > -----
> >
> > local.conf:
> > PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
> > PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
> > CONF_VERSION =3D "1"
> >
> > PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
> > PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
> > PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
> >
> > IMAGE_INSTALL_append_pn-core-image-minimal =3D " packagegroup-base-vfat
> packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km
> ti-sgx-ddk-um libdrm"
> >
> > -----
> > What am I missing?
> >
> > I try other configurations, like core-image-weston. After "adjusting"
> mesa so it won't install gbm, weston won't boot and I still get the
> previous error.
> > Thank you.
> > Simon
> >
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--001a1149ae0c035d45053e88955c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div>Hi Eric,=
 Denys<br><br></div>Thank you for answering.<br><br></div>I tried the follo=
wing:<br>root@beaglebone:~# gles1test1<br>PVR:(Error): WSEGL_CreateWindowDr=
awable: Couldn&#39;t set CRTC: Invalid argument [0, ]<br>&#39;eglCreateWind=
owSurface&#39; returned egl error &#39;EGL_BAD_ALLOC&#39; (0x3003)<br>root@=
beaglebone:~# gles2test1<br>--------------------- started -----------------=
----<br>PVR:(Error): WSEGL_CreateWindowDrawable: Couldn&#39;t set CRTC: Inv=
alid argument [0, ]<br>&#39;eglCreateWindowSurface&#39; returned egl error =
&#39;EGL_BAD_ALLOC&#39; (0x3003)<br><br></div>I also try other configuratio=
ns, like core-image-weston. After &quot;adjusting&quot;=20
mesa so it won&#39;t install gbm, weston won&#39;t boot and I still errors.=
<br><br></div>here the weston output:<br>starting with no config<br>Loding =
module/usr/lib/weston/drm-backend.so<br>output repaint windows is 7 ms maxi=
mun<br>initilizing drm backend<br>using /dev/dri/card0<br>Loading module /u=
sr/lib/weston/gl-rendered.so<br>...<br>loaded module: found gbm_pvr.so<br>f=
ound valid GBM backend : gbm_pvr.so<br>warning no EGL_EXT_platform_base sup=
port of specific platform; failling back to eglGetDisplay<br>failed to choo=
se EGL config<br>failed to initialize egl<br>fatal: failed to create compos=
itor backend<br><br><br></div>I think the problem is around the drm thing. =
I&#39;m not an expert but:<br></div>when I look at /dev/dri/*, I see 2 card=
 ( as if there is 2 drm driver)<br>root@beaglebone:~# ls -lsa /dev/dri/<br>=
=C2=A0=C2=A0=C2=A0=C2=A0 0 drwxr-xr-x=C2=A0=C2=A0=C2=A0 2 root=C2=A0=C2=A0=
=C2=A0=C2=A0 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 120 Jan=C2=A0 1=C2=A0 1970 .<br>=C2=A0=C2=A0=C2=A0=C2=A0 0 drwxr-xr-x=
=C2=A0=C2=A0 11 root=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 13160 Oct=C2=A0 6 04:22 ..<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 0 crw-rw----=C2=A0=C2=A0=C2=A0 1 root=C2=A0=C2=A0=C2=A0=C2=A0 video=
=C2=A0=C2=A0=C2=A0=C2=A0 226,=C2=A0=C2=A0 0 Jan=C2=A0 1=C2=A0 1970 card0<br=
>=C2=A0=C2=A0=C2=A0=C2=A0 0 crw-rw----=C2=A0=C2=A0=C2=A0 1 root=C2=A0=C2=A0=
=C2=A0=C2=A0 video=C2=A0=C2=A0=C2=A0=C2=A0 226,=C2=A0=C2=A0 1 Jan=C2=A0 1=
=C2=A0 1970 card1<br>=C2=A0=C2=A0=C2=A0=C2=A0 0 crw-rw----=C2=A0=C2=A0=C2=
=A0 1 root=C2=A0=C2=A0=C2=A0=C2=A0 video=C2=A0=C2=A0=C2=A0=C2=A0 226,=C2=A0=
 64 Jan=C2=A0 1=C2=A0 1970 controlD64<br>=C2=A0=C2=A0=C2=A0=C2=A0 0 crw-rw-=
---=C2=A0=C2=A0=C2=A0 1 root=C2=A0=C2=A0=C2=A0=C2=A0 video=C2=A0=C2=A0=C2=
=A0=C2=A0 226, 128 Jan=C2=A0 1=C2=A0 1970 renderD128<br></div><div><br></di=
v><div><br></div>also <br>root@beaglebone:~# ls -lsa /sys/class/drm/card0/d=
evice/driver<br>=C2=A0=C2=A0=C2=A0=C2=A0 0 lrwxrwxrwx=C2=A0=C2=A0=C2=A0 1 r=
oot=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Oct=C2=A0 6 04:31 /sys/class/drm/card0/dev=
ice/driver -&gt; ../../../../bus/platform/drivers/tilcdc<br>root@beaglebone=
:~# ls -lsa /sys/class/drm/card1/device/driver<br>=C2=A0=C2=A0=C2=A0=C2=A0 =
0 lrwxrwxrwx=C2=A0=C2=A0=C2=A0 1 root=C2=A0=C2=A0=C2=A0=C2=A0 root=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Oct=C2=A0=
 6 04:35 /sys/class/drm/card1/device/driver -&gt; ../../../../bus/platform/=
drivers/pvrsrvkm<br><br></div>1. So it sound that there is 2 drm drivers is=
 it normal?<br></div>2. Should I change the device three to remove tilcdc, =
so the only drm driver will be pvrsrvkm?<br></div>3. Is there something to =
do to ensure libdrm use the SGX driver?<br><div><div><div><div><div><div><d=
iv><div><br></div></div></div></div></div></div></div></div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Oct 10, 2016 at 10=
:27 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.=
com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">FYI, that is not part of meta-ti - both kmscube and SGX de=
mos are part of<br>
meta-arago application layer, not meta-ti BSP layer.<br>
<br>
--<br>
Denys<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Mon, Oct 10, 2016 at 02:19:22PM +0000, Ruei, Eric wrote:<br>
&gt; Hi, Simon:<br>
&gt;<br>
&gt; Most of the SGX test programs including sgx_init_test will not work an=
ymore because we have switched to DRM-based EGL Window Systems.<br>
&gt; Have you tried other SGX test programs at the file system?<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Weston?<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT programs ion top of Weston?<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Without Weston<br>
&gt;<br>
&gt; o=C2=A0 =C2=A0Kmscube<br>
&gt;<br>
&gt; o=C2=A0 =C2=A0/usr/bin/SGX/demos/Raw/ OGLES2ChameleonMan<br>
&gt;<br>
&gt; o=C2=A0 =C2=A0=E2=80=A6<br>
&gt;<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Eric<br>
&gt; From: <a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-boun=
ces@yoctoproject.<wbr>org</a> [mailto:<a href=3D"mailto:meta-ti-bounces@yoc=
toproject.org">meta-ti-bounces@<wbr>yoctoproject.org</a>] On Behalf Of Simo=
n Pelletier-Thibault<br>
&gt; Sent: Friday, October 07, 2016 9:49 PM<br>
&gt; To: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: [meta-ti] BeagleBone Black - ti-sgx-ddk not working on yocto =
Krogoth, what is missing<br>
&gt;<br>
&gt; Hi,<br>
&gt; I&#39;m trying to use sgx driver for EGL application on BeagleBone Bla=
ck. I build a minimal image to test it and it is not working.<br>
&gt; I got this:<br>
&gt; root@beaglebone:~# sgx_init_test<br>
&gt; ----------------------- Start -----------------------<br>
&gt; Try calling PVRSRVConnect with an invalid argument:<br>
&gt; PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]<br>
&gt; PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]<br>
&gt;=C2=A0 OK<br>
&gt; Call PVRSRVConnect with a valid argument:<br>
&gt;=C2=A0 OK<br>
&gt; Try calling PVRSRVEnumerateDevices with invalid puiNumDevices:<br>
&gt; PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]<br>
&gt;=C2=A0 OK<br>
&gt; Get number of devices from PVRSRVEnumerateDevices:<br>
&gt;=C2=A0 OK<br>
&gt; .... Reported 1 devices<br>
&gt; .... Device Number=C2=A0 | Device Type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000=C2=A0 =C2=A0 | PVR=
SRV_DEVICE_ID_SGX<br>
&gt; Attempt to acquire device 0:<br>
&gt;=C2=A0 OK<br>
&gt; Getting SGX Client info<br>
&gt;=C2=A0 OK<br>
&gt; .... ui32ProcessID:266<br>
&gt; Display Class API: enumerate devices<br>
&gt;=C2=A0 OK<br>
&gt; PVRSRVEnumerateDeviceClass() returns 0 display device(s)<br>
&gt;=C2=A0 FAIL - PVRSRV_ERROR_NO_DC_DEVICES_<wbr>FOUND<br>
&gt; -----<br>
&gt; Here my configuration:<br>
&gt; bblayes.conf:<br>
&gt; POKY_BBLAYERS_CONF_VERSION =3D &quot;2&quot;<br>
&gt;<br>
&gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt; BBFILES ?=3D &quot;&quot;<br>
&gt;<br>
&gt; BBLAYERS ?=3D &quot; \<br>
&gt;=C2=A0 =C2=A0/path/poky2.1/meta \<br>
&gt;=C2=A0 =C2=A0/path/poky2.1/meta-poky \<br>
&gt;=C2=A0 =C2=A0/path/meta-ti2 \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -----<br>
&gt;<br>
&gt; local.conf:<br>
&gt; PACKAGECONFIG_append_pn-qemu-<wbr>native =3D &quot; sdl&quot;<br>
&gt; PACKAGECONFIG_append_pn-<wbr>nativesdk-qemu =3D &quot; sdl&quot;<br>
&gt; CONF_VERSION =3D &quot;1&quot;<br>
&gt;<br>
&gt; PREFERRED_PROVIDER_virtual/egl =3D &quot;ti-sgx-ddk-um&quot;<br>
&gt; PREFERRED_PROVIDER_virtual/<wbr>libgles1 =3D &quot;ti-sgx-ddk-um&quot;=
<br>
&gt; PREFERRED_PROVIDER_virtual/<wbr>libgles2 =3D &quot;ti-sgx-ddk-um&quot;=
<br>
&gt;<br>
&gt; IMAGE_INSTALL_append_pn-core-<wbr>image-minimal =3D &quot; packagegrou=
p-base-vfat packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km=
 ti-sgx-ddk-um libdrm&quot;<br>
&gt;<br>
&gt; -----<br>
&gt; What am I missing?<br>
&gt;<br>
&gt; I try other configurations, like core-image-weston. After &quot;adjust=
ing&quot; mesa so it won&#39;t install gbm, weston won&#39;t boot and I sti=
ll get the previous error.<br>
&gt; Thank you.<br>
&gt; Simon<br>
&gt;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/met=
a-ti</a><br>
<br>
</font></span></blockquote></div><br></div>

--001a1149ae0c035d45053e88955c--
