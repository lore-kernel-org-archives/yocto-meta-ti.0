Return-Path: <michael@amarulasolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14D7DE0082A; Sun, 31 Aug 2014 23:37:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1777E00821
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 23:37:14 -0700 (PDT)
Received: by mail-wg0-f43.google.com with SMTP id a1so4817091wgh.26
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 23:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=eac8C9/pKBrH9UTtnloh0Dgul/iaOkk9qfYO7qwYkAk=;
	b=XSs3Fx3oCstUstX7Aoz4ViDeK/KQeRBbE8lMBwn/hprr0iqgrD3u1guXyzZ8Y0MbIs
	OiDL/z7whsA0RlJygRY9Hz3xp5eFyhxA9fwJDuNc9fB19qZk6BSVjB2Qj/DSwv87hwdU
	gK6V0wgMfEN4v/m8BLAsEoojk2RgG7HFAZLeuco7NNqI7ciXUef95kIOysmaB/UtBXBH
	pY7Wyu2lXhHBp22DN5zm2VTokme1rw13Bv6s/lCYaSGhyO9WgZK4oR9mz3yFNYCADSyU
	tvPpEK49ajG36QvGrl6whXsTeN4UjZLfIEL9nqt5mej6Y6gzFUWwRPzZ/TtLrSI+5HmD
	jBzA==
X-Gm-Message-State: ALoCoQlQ5T0/yuTMJUVJqfXtjoVf1e5Yi9KC/uhF1613hYcHv46aQ+eXV+M8Paaidkf6vpWuWmcB
MIME-Version: 1.0
X-Received: by 10.180.212.78 with SMTP id ni14mr19725247wic.44.1409553433106; 
	Sun, 31 Aug 2014 23:37:13 -0700 (PDT)
Received: by 10.217.68.135 with HTTP; Sun, 31 Aug 2014 23:37:13 -0700 (PDT)
Received: by 10.217.68.135 with HTTP; Sun, 31 Aug 2014 23:37:13 -0700 (PDT)
In-Reply-To: <CA+gsK-qDoxr2OGk5WUGcJAPJNR5XXXem5U9moqtb2gFgXJKOLw@mail.gmail.com>
References: <mailman.3.1409511601.29045.meta-ti@yoctoproject.org>
	<5403809E.3000703@bertux.com>
	<CA+gsK-qDoxr2OGk5WUGcJAPJNR5XXXem5U9moqtb2gFgXJKOLw@mail.gmail.com>
Date: Mon, 1 Sep 2014 08:37:13 +0200
Message-ID: <CAOf5uwkSrNfMg60XF4Qr0jqdi5gm8h_GOF7rUdjU7-oCJpZ7YQ@mail.gmail.com>
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Fabio Berton <fabio@bertux.com>
Subject: Re: BeagleBoard C4 with USB
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
X-List-Received-Date: Mon, 01 Sep 2014 06:37:26 -0000
Content-Type: multipart/alternative; boundary=001a11c238c0ac351b0501fb3bda

--001a11c238c0ac351b0501fb3bda
Content-Type: text/plain; charset=UTF-8

Hi

Il 01/set/2014 06:42 "Rudolf Streif" <rstreif@linuxfoundation.org> ha
scritto:
>
> Thank you, Fabio.
>
> However, that is not the reason. The modules phy_omap_usb2 and
phy_omap_usb3 are built into the kernel but yet the hardware does not seem
to be recognized. That is the case we two different BeagleBoard C4 boards.
>

Can you send please dts and config?

Michael

> :rjs
>
>
>
> On Sun, Aug 31, 2014 at 1:07 PM, Fabio Berton <fabio@bertux.com> wrote:
>>
>> Try to install the packages bellow:
>>
>> kernel-modules
>> usbutils
>>
>>
>> On 08/31/2014 04:00 PM, meta-ti-request@yoctoproject.org wrote:
>>>
>>> Send meta-ti mailing list submissions to
>>>         meta-ti@yoctoproject.org
>>>
>>> To subscribe or unsubscribe via the World Wide Web, visit
>>>         https://lists.yoctoproject.org/listinfo/meta-ti
>>> or, via email, send a message with subject or body 'help' to
>>>         meta-ti-request@yoctoproject.org
>>>
>>> You can reach the person managing the list at
>>>         meta-ti-owner@yoctoproject.org
>>>
>>> When replying, please edit your Subject line so it is more specific
>>> than "Re: Contents of meta-ti digest..."
>>>
>>>
>>> Today's Topics:
>>>
>>>     1. [nightly] Distroless meta-ti/master minimal build
>>>        2014-08-30_21-00-30 (Denys Dmytriyenko)
>>>     2. BeagleBoard C4 with USB (Rudolf Streif)
>>>
>>>
>>> ----------------------------------------------------------------------
>>>
>>> Message: 1
>>> Date: Sat, 30 Aug 2014 21:58:30 -0400
>>> From: Denys Dmytriyenko <denys@ti.com>
>>> To: <meta-ti@yoctoproject.org>
>>> Subject: [meta-ti] [nightly] Distroless meta-ti/master minimal build
>>>         2014-08-30_21-00-30
>>> Message-ID: <1330147917.535.1409450310755.JavaMail.jenkins@puget>
>>> Content-Type: text/plain; charset="us-ascii"
>>>
>>> An HTML attachment was scrubbed...
>>> URL: <
http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-0001.html
>
>>>
>>> ------------------------------
>>>
>>> Message: 2
>>> Date: Sun, 31 Aug 2014 07:48:09 -0700
>>> From: Rudolf Streif <rstreif@linuxfoundation.org>
>>> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
>>> Subject: [meta-ti] BeagleBoard C4 with USB
>>> Message-ID:
>>>         <
CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com>
>>> Content-Type: text/plain; charset="utf-8"
>>>
>>>
>>> I have a BeagleBoard C4 laying around that I want to use for a project
that
>>> has USB devices connected to it. I built a core-image-base with YP from
>>> master and meta-ti from master with this configuration:
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.23.1"
>>> BUILD_SYS         = "x86_64-linux"
>>> NATIVELSBSTRING   = "Fedora-18"
>>> TARGET_SYS        = "arm-poky-linux-gnueabi"
>>> MACHINE           = "beagleboard"
>>> DISTRO            = "poky"
>>> DISTRO_VERSION    = "1.6+snapshot-20140831"
>>> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard
cortexa8"
>>> TARGET_FPU        = "vfp-neon"
>>> meta
>>> meta-yocto
>>> meta-yocto-bsp    = "master:c16795477ea7e2159b5d3808268912b572887e2d"
>>> meta-ti           = "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"
>>> meta-oe           = "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"
>>>
>>> It builds fine. I am installing u-boot, kernel and the device tree on
the
>>> SSD card.
>>>
>>> I use this u-boot script to boot the board:
>>>
>>> setenv bootcmd 'mmc init; fatload mmc 0:1 0x80300000 uImage; fatload mmc
>>> 0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000'
>>> setenv bootargs 'console=tty0 console=ttyO2,115200n8 root=/dev/mmcblk0p2
>>> rootwait rootfstype=ext3 ro'
>>> boot
>>>
>>> In the above beagle.dtb =  uImage--3.14.8-r0-omap3-beagle-<date>.dtb
which
>>> I assumed to be the correct one for the C4 because the other dtb created
>>> has xM explicitly in its name.
>>>
>>> The system boots fine but USB is not working. None of the typical USB
host
>>> controller initialization is in the dmesg output and lsusb responds with
>>> 'unable to initialize libsub: -99'.
>>>
>>> I am not sure if I am doing anything wrong or if there is an actual
issue.
>>> Help appreciated.
>>>
>>> Cheers,
>>> Rudi
>>> -------------- next part --------------
>>> An HTML attachment was scrubbed...
>>> URL: <
http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-0001.html
>
>>>
>>> ------------------------------
>>>
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
>
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--001a11c238c0ac351b0501fb3bda
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi</p>
<p dir=3D"ltr">Il 01/set/2014 06:42 &quot;Rudolf Streif&quot; &lt;<a href=
=3D"mailto:rstreif@linuxfoundation.org">rstreif@linuxfoundation.org</a>&gt;=
 ha scritto:<br>
&gt;<br>
&gt; Thank you, Fabio.<br>
&gt;<br>
&gt; However, that is not the reason. The modules phy_omap_usb2 and phy_oma=
p_usb3 are built into the kernel but yet the hardware does not seem to be r=
ecognized. That is the case we two different BeagleBoard C4 boards.<br>

&gt;</p>
<p dir=3D"ltr">Can you send please dts and config?</p>
<p dir=3D"ltr">Michael</p>
<p dir=3D"ltr">&gt; :rjs<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Aug 31, 2014 at 1:07 PM, Fabio Berton &lt;<a href=3D"mailto:fa=
bio@bertux.com">fabio@bertux.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Try to install the packages bellow:<br>
&gt;&gt;<br>
&gt;&gt; kernel-modules<br>
&gt;&gt; usbutils<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 08/31/2014 04:00 PM, <a href=3D"mailto:meta-ti-request@yoctopro=
ject.org">meta-ti-request@yoctoproject.org</a> wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Send meta-ti mailing list submissions to<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:meta-ti@yoctopro=
ject.org">meta-ti@yoctoproject.org</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To subscribe or unsubscribe via the World Wide Web, visit<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.yoctoproj=
ect.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</=
a><br>
&gt;&gt;&gt; or, via email, send a message with subject or body &#39;help&#=
39; to<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:meta-ti-request@=
yoctoproject.org">meta-ti-request@yoctoproject.org</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; You can reach the person managing the list at<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:meta-ti-owner@yo=
ctoproject.org">meta-ti-owner@yoctoproject.org</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; When replying, please edit your Subject line so it is more spe=
cific<br>
&gt;&gt;&gt; than &quot;Re: Contents of meta-ti digest...&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Today&#39;s Topics:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 1. [nightly] Distroless meta-ti/master minimal b=
uild<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A02014-08-30_21-00-30 (Denys Dmytriye=
nko)<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 2. BeagleBoard C4 with USB (Rudolf Streif)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --------------------------------------------------------------=
--------<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Message: 1<br>
&gt;&gt;&gt; Date: Sat, 30 Aug 2014 21:58:30 -0400<br>
&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">de=
nys@ti.com</a>&gt;<br>
&gt;&gt;&gt; To: &lt;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yo=
ctoproject.org</a>&gt;<br>
&gt;&gt;&gt; Subject: [meta-ti] [nightly] Distroless meta-ti/master minimal=
 build<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 2014-08-30_21-00-30<br>
&gt;&gt;&gt; Message-ID: &lt;1330147917.535.1409450310755.JavaMail.jenkins@=
puget&gt;<br>
&gt;&gt;&gt; Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; An HTML attachment was scrubbed...<br>
&gt;&gt;&gt; URL: &lt;<a href=3D"http://lists.yoctoproject.org/pipermail/me=
ta-ti/attachments/20140830/406dab3a/attachment-0001.html">http://lists.yoct=
oproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-000=
1.html</a>&gt;<br>

&gt;&gt;&gt;<br>
&gt;&gt;&gt; ------------------------------<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Message: 2<br>
&gt;&gt;&gt; Date: Sun, 31 Aug 2014 07:48:09 -0700<br>
&gt;&gt;&gt; From: Rudolf Streif &lt;<a href=3D"mailto:rstreif@linuxfoundat=
ion.org">rstreif@linuxfoundation.org</a>&gt;<br>
&gt;&gt;&gt; To: &quot;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@=
yoctoproject.org</a>&quot; &lt;<a href=3D"mailto:meta-ti@yoctoproject.org">=
meta-ti@yoctoproject.org</a>&gt;<br>
&gt;&gt;&gt; Subject: [meta-ti] BeagleBoard C4 with USB<br>
&gt;&gt;&gt; Message-ID:<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:CA%2BgsK-oku=
yjWuEp%2B3bm6%2B%2BojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com">CA+gsK-okuy=
jWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com</a>&gt;<br>
&gt;&gt;&gt; Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have a BeagleBoard C4 laying around that I want to use for a=
 project that<br>
&gt;&gt;&gt; has USB devices connected to it. I built a core-image-base wit=
h YP from<br>
&gt;&gt;&gt; master and meta-ti from master with this configuration:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Build Configuration:<br>
&gt;&gt;&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.23.1&quot;<b=
r>
&gt;&gt;&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-li=
nux&quot;<br>
&gt;&gt;&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Fedora-18&quot;<br>
&gt;&gt;&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-poky-linux=
-gnueabi&quot;<br>
&gt;&gt;&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;beag=
leboard&quot;<br>
&gt;&gt;&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky=
&quot;<br>
&gt;&gt;&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;1.6+snapshot-20140831&qu=
ot;<br>
&gt;&gt;&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp thum=
b neon callconvention-hard cortexa8&quot;<br>
&gt;&gt;&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;vfp-neon&quot;=
<br>
&gt;&gt;&gt; meta<br>
&gt;&gt;&gt; meta-yocto<br>
&gt;&gt;&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;master:c16795477ea7e2159=
b5d3808268912b572887e2d&quot;<br>
&gt;&gt;&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mast=
er:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb&quot;<br>
&gt;&gt;&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mast=
er:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It builds fine. I am installing u-boot, kernel and the device =
tree on the<br>
&gt;&gt;&gt; SSD card.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I use this u-boot script to boot the board:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; setenv bootcmd &#39;mmc init; fatload mmc 0:1 0x80300000 uImag=
e; fatload mmc<br>
&gt;&gt;&gt; 0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000&#39;<=
br>
&gt;&gt;&gt; setenv bootargs &#39;console=3Dtty0 console=3DttyO2,115200n8 r=
oot=3D/dev/mmcblk0p2<br>
&gt;&gt;&gt; rootwait rootfstype=3Dext3 ro&#39;<br>
&gt;&gt;&gt; boot<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In the above beagle.dtb =3D=C2=A0 uImage--3.14.8-r0-omap3-beag=
le-&lt;date&gt;.dtb which<br>
&gt;&gt;&gt; I assumed to be the correct one for the C4 because the other d=
tb created<br>
&gt;&gt;&gt; has xM explicitly in its name.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The system boots fine but USB is not working. None of the typi=
cal USB host<br>
&gt;&gt;&gt; controller initialization is in the dmesg output and lsusb res=
ponds with<br>
&gt;&gt;&gt; &#39;unable to initialize libsub: -99&#39;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am not sure if I am doing anything wrong or if there is an a=
ctual issue.<br>
&gt;&gt;&gt; Help appreciated.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt; Rudi<br>
&gt;&gt;&gt; -------------- next part --------------<br>
&gt;&gt;&gt; An HTML attachment was scrubbed...<br>
&gt;&gt;&gt; URL: &lt;<a href=3D"http://lists.yoctoproject.org/pipermail/me=
ta-ti/attachments/20140831/fc724dcd/attachment-0001.html">http://lists.yoct=
oproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-000=
1.html</a>&gt;<br>

&gt;&gt;&gt;<br>
&gt;&gt;&gt; ------------------------------<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-ti mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https:=
//lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
</p>

--001a11c238c0ac351b0501fb3bda--
