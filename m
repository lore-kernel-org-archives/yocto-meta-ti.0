Return-Path: <simon.pelletiert@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EFABE00DDE; Tue, 11 Oct 2016 19:40:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (simon.pelletiert[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.172 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.172 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5145E00DCA
	for <meta-ti@yoctoproject.org>; Tue, 11 Oct 2016 19:40:53 -0700 (PDT)
Received: by mail-qk0-f172.google.com with SMTP id n189so14326968qke.0
	for <meta-ti@yoctoproject.org>; Tue, 11 Oct 2016 19:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5MmfGHo7Z/TuSCi5VmI4LIrkQnocm/XMVwNzIzu3cW8=;
	b=ZEgKYqXCFu9FUpJrDB9TqT3mn0j8fFV2f+8CwhE+uz4yX7L4Iodz6Q3mF4iej1poLS
	flqIuxfx9jXHIXVjuiOO3xCBr9bg0WGv3R0A5PWRep6MsImgAMa/1/eON2tiHV8m7cDs
	VRBmSGHoYHlrNwB3UwyqfYYSgxi73TECq3ezGPeLcoz+01czHGcwHXuywcNT4MPDsyB6
	/CnaetdXxpQm7Z4XL05THaqqXVvXIH01RpYAClMTmn1MtAw/z6UR+6wCPzNM3obVsgmi
	PJgOAsutaBtCvZxTYi3eCaCAU0qVC6GhAh0pv5iHm2SyxM5ymBxTClgw3zpCeKJK2sFP
	w3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5MmfGHo7Z/TuSCi5VmI4LIrkQnocm/XMVwNzIzu3cW8=;
	b=XyiwnhSCse1oS4h8OyczpUfnDWdTfLj9nzDMFjN2h67MSmNR9/TmEcAx5VGYg7sexD
	4Gh8kJS34VS+ifiAmeBpn0pXeiqtRouDAmm98PFz+mie9eRB1TBoLi2obgMYaQ0Xyr9N
	3LB+2xUqk506TyFEf07/ERBZlwb2tNNM8P75eFay1LF8Kkv6spsB4tkseTRVVyy++DTs
	nDqgSEkcGOnfr5PpOXtiHDDmFXbGinrKJLW3vg+oqGkvkHEl/Ab3U0tt1cx9879XNJpU
	dr/csG68RQtKhsCT2VY68jBxEZAAOZF8flFr+rRmEDl+yZvWWdEUUBeqDWHaacafuiOs
	wlWw==
X-Gm-Message-State: AA6/9RnZhm4FpZnY7FtTREXIzQOdWvLRn99O5tsWHldjY54MY33EpxhbqfvRsPMLwMzHsep/O7JSknbrs99n9g==
X-Received: by 10.55.162.150 with SMTP id l144mr7009144qke.72.1476240052651;
	Tue, 11 Oct 2016 19:40:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.164 with HTTP; Tue, 11 Oct 2016 19:40:52 -0700 (PDT)
In-Reply-To: <20161011090432.GS12745@edge>
References: <CAMUfapSLsRQiC=ugzRWLJHqFS-PzV9evCx0CQtWRqzdO=vC6GA@mail.gmail.com>
	<009C030982313E4589C6BC55FBF1E82A142D6938@DFLE09.ent.ti.com>
	<20161010142749.GR12745@edge>
	<CAMUfapRgck57qr2oyGJb02qiUmyU+6nart61uYSQiFtKo6mDcQ@mail.gmail.com>
	<20161011090432.GS12745@edge>
From: Simon Pelletier-Thibault <simon.pelletiert@gmail.com>
Date: Tue, 11 Oct 2016 22:40:52 -0400
Message-ID: <CAMUfapT6GW9kZ5X5gJkAnnhuWeqUQnYbmpcNYxXFXCPM8FH9iw@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 02:40:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c06dde4f10f7d053ea1eb06

--94eb2c06dde4f10f7d053ea1eb06
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Thank you, for your answer.

It sound like meta-arago has some of solutions for my problem, I'm going to
try to add this to my build.

Do you have a "recommanded way" to get rid of the mesa/libgbm problem?
For now,
I add this to my local.conf:
PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"

I remove manually all the reference of gbm in
meta/recipes-graphics/mesa/mesa.inc. However, it is certainly not the right
way to do it.

Simon

On Tue, Oct 11, 2016 at 5:04 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Is this what you are looking for?
> http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3D
> meta-arago-distro/recipes-graphics/wayland/weston/0001-
> udev-seat-restrict-udev-enumeration-to-card0.patch;hb=3DHEAD
>
> BTW, you don't need mesa at all, just libgbm, but it requires some
> massaging
> with PREFERRED_PROVIDERs and bbappends to get it going for now, although
> there's been some discussion to get it fixed upstream in the future...
>
> --
> Denys
>
>
> On Mon, Oct 10, 2016 at 04:26:59PM -0400, Simon Pelletier-Thibault wrote:
> > Hi Eric, Denys
> >
> > Thank you for answering.
> >
> > I tried the following:
> > root@beaglebone:~# gles1test1
> > PVR:(Error): WSEGL_CreateWindowDrawable: Couldn't set CRTC: Invalid
> > argument [0, ]
> > 'eglCreateWindowSurface' returned egl error 'EGL_BAD_ALLOC' (0x3003)
> > root@beaglebone:~# gles2test1
> > --------------------- started ---------------------
> > PVR:(Error): WSEGL_CreateWindowDrawable: Couldn't set CRTC: Invalid
> > argument [0, ]
> > 'eglCreateWindowSurface' returned egl error 'EGL_BAD_ALLOC' (0x3003)
> >
> > I also try other configurations, like core-image-weston. After
> "adjusting"
> > mesa so it won't install gbm, weston won't boot and I still errors.
> >
> > here the weston output:
> > starting with no config
> > Loding module/usr/lib/weston/drm-backend.so
> > output repaint windows is 7 ms maximun
> > initilizing drm backend
> > using /dev/dri/card0
> > Loading module /usr/lib/weston/gl-rendered.so
> > ...
> > loaded module: found gbm_pvr.so
> > found valid GBM backend : gbm_pvr.so
> > warning no EGL_EXT_platform_base support of specific platform; failling
> > back to eglGetDisplay
> > failed to choose EGL config
> > failed to initialize egl
> > fatal: failed to create compositor backend
> >
> >
> > I think the problem is around the drm thing. I'm not an expert but:
> > when I look at /dev/dri/*, I see 2 card ( as if there is 2 drm driver)
> > root@beaglebone:~# ls -lsa /dev/dri/
> >      0 drwxr-xr-x    2 root     root           120 Jan  1  1970 .
> >      0 drwxr-xr-x   11 root     root         13160 Oct  6 04:22 ..
> >      0 crw-rw----    1 root     video     226,   0 Jan  1  1970 card0
> >      0 crw-rw----    1 root     video     226,   1 Jan  1  1970 card1
> >      0 crw-rw----    1 root     video     226,  64 Jan  1  1970
> controlD64
> >      0 crw-rw----    1 root     video     226, 128 Jan  1  1970
> renderD128
> >
> >
> > also
> > root@beaglebone:~# ls -lsa /sys/class/drm/card0/device/driver
> >      0 lrwxrwxrwx    1 root     root             0 Oct  6 04:31
> > /sys/class/drm/card0/device/driver ->
> > ../../../../bus/platform/drivers/tilcdc
> > root@beaglebone:~# ls -lsa /sys/class/drm/card1/device/driver
> >      0 lrwxrwxrwx    1 root     root             0 Oct  6 04:35
> > /sys/class/drm/card1/device/driver ->
> > ../../../../bus/platform/drivers/pvrsrvkm
> >
> > 1. So it sound that there is 2 drm drivers is it normal?
> > 2. Should I change the device three to remove tilcdc, so the only drm
> > driver will be pvrsrvkm?
> > 3. Is there something to do to ensure libdrm use the SGX driver?
> >
> >
> > On Mon, Oct 10, 2016 at 10:27 AM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> >
> > > FYI, that is not part of meta-ti - both kmscube and SGX demos are par=
t
> of
> > > meta-arago application layer, not meta-ti BSP layer.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Mon, Oct 10, 2016 at 02:19:22PM +0000, Ruei, Eric wrote:
> > > > Hi, Simon:
> > > >
> > > > Most of the SGX test programs including sgx_init_test will not work
> > > anymore because we have switched to DRM-based EGL Window Systems.
> > > > Have you tried other SGX test programs at the file system?
> > > >
> > > > -          Weston?
> > > >
> > > > -          QT programs ion top of Weston?
> > > >
> > > > -          Without Weston
> > > >
> > > > o   Kmscube
> > > >
> > > > o   /usr/bin/SGX/demos/Raw/ OGLES2ChameleonMan
> > > >
> > > > o   =E2=80=A6
> > > >
> > > > Best regards,
> > > >
> > > > Eric
> > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@
> > > yoctoproject.org] On Behalf Of Simon Pelletier-Thibault
> > > > Sent: Friday, October 07, 2016 9:49 PM
> > > > To: meta-ti@yoctoproject.org
> > > > Subject: [meta-ti] BeagleBone Black - ti-sgx-ddk not working on yoc=
to
> > > Krogoth, what is missing
> > > >
> > > > Hi,
> > > > I'm trying to use sgx driver for EGL application on BeagleBone
> Black. I
> > > build a minimal image to test it and it is not working.
> > > > I got this:
> > > > root@beaglebone:~# sgx_init_test
> > > > ----------------------- Start -----------------------
> > > > Try calling PVRSRVConnect with an invalid argument:
> > > > PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]
> > > > PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]
> > > >  OK
> > > > Call PVRSRVConnect with a valid argument:
> > > >  OK
> > > > Try calling PVRSRVEnumerateDevices with invalid puiNumDevices:
> > > > PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]
> > > >  OK
> > > > Get number of devices from PVRSRVEnumerateDevices:
> > > >  OK
> > > > .... Reported 1 devices
> > > > .... Device Number  | Device Type
> > > >             0000    | PVRSRV_DEVICE_ID_SGX
> > > > Attempt to acquire device 0:
> > > >  OK
> > > > Getting SGX Client info
> > > >  OK
> > > > .... ui32ProcessID:266
> > > > Display Class API: enumerate devices
> > > >  OK
> > > > PVRSRVEnumerateDeviceClass() returns 0 display device(s)
> > > >  FAIL - PVRSRV_ERROR_NO_DC_DEVICES_FOUND
> > > > -----
> > > > Here my configuration:
> > > > bblayes.conf:
> > > > POKY_BBLAYERS_CONF_VERSION =3D "2"
> > > >
> > > > BBPATH =3D "${TOPDIR}"
> > > > BBFILES ?=3D ""
> > > >
> > > > BBLAYERS ?=3D " \
> > > >   /path/poky2.1/meta \
> > > >   /path/poky2.1/meta-poky \
> > > >   /path/meta-ti2 \
> > > >   "
> > > > -----
> > > >
> > > > local.conf:
> > > > PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
> > > > PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
> > > > CONF_VERSION =3D "1"
> > > >
> > > > PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
> > > > PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
> > > > PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
> > > >
> > > > IMAGE_INSTALL_append_pn-core-image-minimal =3D "
> packagegroup-base-vfat
> > > packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km
> > > ti-sgx-ddk-um libdrm"
> > > >
> > > > -----
> > > > What am I missing?
> > > >
> > > > I try other configurations, like core-image-weston. After "adjustin=
g"
> > > mesa so it won't install gbm, weston won't boot and I still get the
> > > previous error.
> > > > Thank you.
> > > > Simon
> > > >
> > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> > >
>

--94eb2c06dde4f10f7d053ea1eb06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Denys,<br><br></div>Thank you,=
 for your answer.<br><br></div>It sound like meta-arago has some of solutio=
ns for my problem, I&#39;m going to try to add this to my build.<br><br></d=
iv>Do you have a &quot;recommanded way&quot; to get rid of the mesa/libgbm =
problem?<br></div>For now, <br></div><div>I add this to my local.conf:<br>P=
REFERRED_PROVIDER_virtual/egl =3D &quot;ti-sgx-ddk-um&quot;<br>PREFERRED_PR=
OVIDER_virtual/<wbr>libgles1 =3D &quot;ti-sgx-ddk-um&quot;<br>PREFERRED_PRO=
VIDER_virtual/<wbr>libgles2 =3D &quot;ti-sgx-ddk-um&quot;<br></div><div><br=
>I remove manually all the reference of gbm in meta/recipes-graphics/mesa/m=
esa.inc. However, it is certainly not the right way to do it.<br><br></div>=
<div>Simon<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Tue, Oct 11, 2016 at 5:04 AM, Denys Dmytriyenko <span dir=3D"lt=
r">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Is this what you are loo=
king for?<br>
<a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dme=
ta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-ude=
v-enumeration-to-card0.patch;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank=
">http://arago-project.org/git/?<wbr>p=3Dmeta-arago.git;a=3Dblob;f=3D<wbr>m=
eta-arago-distro/recipes-<wbr>graphics/wayland/weston/0001-<wbr>udev-seat-r=
estrict-udev-<wbr>enumeration-to-card0.patch;hb=3D<wbr>HEAD</a><br>
<br>
BTW, you don&#39;t need mesa at all, just libgbm, but it requires some mass=
aging<br>
with PREFERRED_PROVIDERs and bbappends to get it going for now, although<br=
>
there&#39;s been some discussion to get it fixed upstream in the future...<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Mon, Oct 10, 2016 at 04:26:59PM -0400, Simon Pelletier-Thibault wrote:<b=
r>
&gt; Hi Eric, Denys<br>
&gt;<br>
&gt; Thank you for answering.<br>
&gt;<br>
&gt; I tried the following:<br>
&gt; root@beaglebone:~# gles1test1<br>
&gt; PVR:(Error): WSEGL_CreateWindowDrawable: Couldn&#39;t set CRTC: Invali=
d<br>
&gt; argument [0, ]<br>
&gt; &#39;eglCreateWindowSurface&#39; returned egl error &#39;EGL_BAD_ALLOC=
&#39; (0x3003)<br>
&gt; root@beaglebone:~# gles2test1<br>
&gt; --------------------- started ---------------------<br>
&gt; PVR:(Error): WSEGL_CreateWindowDrawable: Couldn&#39;t set CRTC: Invali=
d<br>
&gt; argument [0, ]<br>
&gt; &#39;eglCreateWindowSurface&#39; returned egl error &#39;EGL_BAD_ALLOC=
&#39; (0x3003)<br>
&gt;<br>
&gt; I also try other configurations, like core-image-weston. After &quot;a=
djusting&quot;<br>
&gt; mesa so it won&#39;t install gbm, weston won&#39;t boot and I still er=
rors.<br>
&gt;<br>
&gt; here the weston output:<br>
&gt; starting with no config<br>
&gt; Loding module/usr/lib/weston/drm-<wbr>backend.so<br>
&gt; output repaint windows is 7 ms maximun<br>
&gt; initilizing drm backend<br>
&gt; using /dev/dri/card0<br>
&gt; Loading module /usr/lib/weston/gl-rendered.so<br>
&gt; ...<br>
&gt; loaded module: found gbm_pvr.so<br>
&gt; found valid GBM backend : gbm_pvr.so<br>
&gt; warning no EGL_EXT_platform_base support of specific platform; faillin=
g<br>
&gt; back to eglGetDisplay<br>
&gt; failed to choose EGL config<br>
&gt; failed to initialize egl<br>
&gt; fatal: failed to create compositor backend<br>
&gt;<br>
&gt;<br>
&gt; I think the problem is around the drm thing. I&#39;m not an expert but=
:<br>
&gt; when I look at /dev/dri/*, I see 2 card ( as if there is 2 drm driver)=
<br>
&gt; root@beaglebone:~# ls -lsa /dev/dri/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 drwxr-xr-x=C2=A0 =C2=A0 2 root=C2=A0 =C2=A0 =C2=
=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0120 Jan=C2=A0 1=C2=A0 1970 =
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 drwxr-xr-x=C2=A0 =C2=A011 root=C2=A0 =C2=A0 =C2=
=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013160 Oct=C2=A0 6 04:22 ..<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 crw-rw----=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0video=C2=A0 =C2=A0 =C2=A0226,=C2=A0 =C2=A00 Jan=C2=A0 1=C2=A0 1970 card0=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 crw-rw----=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0video=C2=A0 =C2=A0 =C2=A0226,=C2=A0 =C2=A01 Jan=C2=A0 1=C2=A0 1970 card1=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 crw-rw----=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0video=C2=A0 =C2=A0 =C2=A0226,=C2=A0 64 Jan=C2=A0 1=C2=A0 1970 controlD64=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 crw-rw----=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0video=C2=A0 =C2=A0 =C2=A0226, 128 Jan=C2=A0 1=C2=A0 1970 renderD128<br>
&gt;<br>
&gt;<br>
&gt; also<br>
&gt; root@beaglebone:~# ls -lsa /sys/class/drm/card0/device/<wbr>driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 Oct=C2=A0 6 04:31<=
br>
&gt; /sys/class/drm/card0/device/<wbr>driver -&gt;<br>
&gt; ../../../../bus/platform/<wbr>drivers/tilcdc<br>
&gt; root@beaglebone:~# ls -lsa /sys/class/drm/card1/device/<wbr>driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0 lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 Oct=C2=A0 6 04:35<=
br>
&gt; /sys/class/drm/card1/device/<wbr>driver -&gt;<br>
&gt; ../../../../bus/platform/<wbr>drivers/pvrsrvkm<br>
&gt;<br>
&gt; 1. So it sound that there is 2 drm drivers is it normal?<br>
&gt; 2. Should I change the device three to remove tilcdc, so the only drm<=
br>
&gt; driver will be pvrsrvkm?<br>
&gt; 3. Is there something to do to ensure libdrm use the SGX driver?<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Oct 10, 2016 at 10:27 AM, Denys Dmytriyenko &lt;<a href=3D"mai=
lto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; FYI, that is not part of meta-ti - both kmscube and SGX demos are=
 part of<br>
&gt; &gt; meta-arago application layer, not meta-ti BSP layer.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 10, 2016 at 02:19:22PM +0000, Ruei, Eric wrote:<br>
&gt; &gt; &gt; Hi, Simon:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Most of the SGX test programs including sgx_init_test will n=
ot work<br>
&gt; &gt; anymore because we have switched to DRM-based EGL Window Systems.=
<br>
&gt; &gt; &gt; Have you tried other SGX test programs at the file system?<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Weston?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT programs ion top of W=
eston?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Without Weston<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; o=C2=A0 =C2=A0Kmscube<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; o=C2=A0 =C2=A0/usr/bin/SGX/demos/Raw/ OGLES2ChameleonMan<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; o=C2=A0 =C2=A0=E2=80=A6<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Eric<br>
&gt; &gt; &gt; From: <a href=3D"mailto:meta-ti-bounces@yoctoproject.org">me=
ta-ti-bounces@yoctoproject.<wbr>org</a> [mailto:<a href=3D"mailto:meta-ti-b=
ounces@">meta-ti-bounces@</a><br>
&gt; &gt; <a href=3D"http://yoctoproject.org" rel=3D"noreferrer" target=3D"=
_blank">yoctoproject.org</a>] On Behalf Of Simon Pelletier-Thibault<br>
&gt; &gt; &gt; Sent: Friday, October 07, 2016 9:49 PM<br>
&gt; &gt; &gt; To: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoct=
oproject.org</a><br>
&gt; &gt; &gt; Subject: [meta-ti] BeagleBone Black - ti-sgx-ddk not working=
 on yocto<br>
&gt; &gt; Krogoth, what is missing<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; I&#39;m trying to use sgx driver for EGL application on Beag=
leBone Black. I<br>
&gt; &gt; build a minimal image to test it and it is not working.<br>
&gt; &gt; &gt; I got this:<br>
&gt; &gt; &gt; root@beaglebone:~# sgx_init_test<br>
&gt; &gt; &gt; ----------------------- Start -----------------------<br>
&gt; &gt; &gt; Try calling PVRSRVConnect with an invalid argument:<br>
&gt; &gt; &gt; PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]<br>
&gt; &gt; &gt; PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]=
<br>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; Call PVRSRVConnect with a valid argument:<br>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; Try calling PVRSRVEnumerateDevices with invalid puiNumDevice=
s:<br>
&gt; &gt; &gt; PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]<br=
>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; Get number of devices from PVRSRVEnumerateDevices:<br>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; .... Reported 1 devices<br>
&gt; &gt; &gt; .... Device Number=C2=A0 | Device Type<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000=C2=A0 =
=C2=A0 | PVRSRV_DEVICE_ID_SGX<br>
&gt; &gt; &gt; Attempt to acquire device 0:<br>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; Getting SGX Client info<br>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; .... ui32ProcessID:266<br>
&gt; &gt; &gt; Display Class API: enumerate devices<br>
&gt; &gt; &gt;=C2=A0 OK<br>
&gt; &gt; &gt; PVRSRVEnumerateDeviceClass() returns 0 display device(s)<br>
&gt; &gt; &gt;=C2=A0 FAIL - PVRSRV_ERROR_NO_DC_DEVICES_<wbr>FOUND<br>
&gt; &gt; &gt; -----<br>
&gt; &gt; &gt; Here my configuration:<br>
&gt; &gt; &gt; bblayes.conf:<br>
&gt; &gt; &gt; POKY_BBLAYERS_CONF_VERSION =3D &quot;2&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt; &gt; &gt; BBFILES ?=3D &quot;&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; BBLAYERS ?=3D &quot; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0/path/poky2.1/meta \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0/path/poky2.1/meta-poky \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0/path/meta-ti2 \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt; -----<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; local.conf:<br>
&gt; &gt; &gt; PACKAGECONFIG_append_pn-qemu-<wbr>native =3D &quot; sdl&quot=
;<br>
&gt; &gt; &gt; PACKAGECONFIG_append_pn-<wbr>nativesdk-qemu =3D &quot; sdl&q=
uot;<br>
&gt; &gt; &gt; CONF_VERSION =3D &quot;1&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; PREFERRED_PROVIDER_virtual/egl =3D &quot;ti-sgx-ddk-um&quot;=
<br>
&gt; &gt; &gt; PREFERRED_PROVIDER_virtual/<wbr>libgles1 =3D &quot;ti-sgx-dd=
k-um&quot;<br>
&gt; &gt; &gt; PREFERRED_PROVIDER_virtual/<wbr>libgles2 =3D &quot;ti-sgx-dd=
k-um&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; IMAGE_INSTALL_append_pn-core-<wbr>image-minimal =3D &quot; p=
ackagegroup-base-vfat<br>
&gt; &gt; packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km<b=
r>
&gt; &gt; ti-sgx-ddk-um libdrm&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -----<br>
&gt; &gt; &gt; What am I missing?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I try other configurations, like core-image-weston. After &q=
uot;adjusting&quot;<br>
&gt; &gt; mesa so it won&#39;t install gbm, weston won&#39;t boot and I sti=
ll get the<br>
&gt; &gt; previous error.<br>
&gt; &gt; &gt; Thank you.<br>
&gt; &gt; &gt; Simon<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctopro=
ject.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/li=
stinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div>

--94eb2c06dde4f10f7d053ea1eb06--
