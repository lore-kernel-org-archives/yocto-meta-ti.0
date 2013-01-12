Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4010CE01275
	for <meta-ti@yoctoproject.org>; Sat, 12 Jan 2013 11:16:51 -0800 (PST)
Received: by mail-lb0-f182.google.com with SMTP id go10so2073690lbb.27
	for <meta-ti@yoctoproject.org>; Sat, 12 Jan 2013 11:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=6NjzMfRmTYovk9BOk3kYa/wQGqO9JMpUAPEjLrHF4mA=;
	b=P7/d65zpxiIM6ryDBqMgg2vqcCERW9Dv7cBcbfThAq/qXQufo4vkcxzplBAtJkRe52
	Il7PPCv9qz6PZnyHL7ZXI6+NmXh1H+JBle9XzMzCmzDp/ROJfpASjJ+x8HWdqS+LNE3q
	0r9Fp5rlI5sd+38TTcDSCa3DK71UARrz5aoOrOFGy+77ybseL2HM+m64qm8qbyiEQI3I
	k2b2sL/NBGTI4ie6f13Ie/k7xoR39SmddRydaVCah1+BSkb98Icp0Xnpsg4Ecqr+XJ/7
	xGoXMS6OYLljyHJrFtwoKk+l50J07L6ONfAY+7F1Ws4e4PclrbIbYaOD4DspeL1vpoJ0
	Mz3A==
Received: by 10.152.144.103 with SMTP id sl7mr27800116lab.23.1358018209632;
	Sat, 12 Jan 2013 11:16:49 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Sat, 12 Jan 2013 11:16:29 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301120516390.14709@oneiric>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<alpine.DEB.2.02.1301101008200.7994@oneiric>
	<CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
	<alpine.DEB.2.02.1301110652110.10214@oneiric>
	<CABcZANmH2DVSoaWz8Ob66QPjtt79cRjpEeQ9EuAj4uwTOU9WBA@mail.gmail.com>
	<alpine.DEB.2.02.1301120516390.14709@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 12 Jan 2013 12:16:29 -0700
X-Google-Sender-Auth: -m6OQVo-4YF9LUuy_HCEPuxuCwg
Message-ID: <CABcZANkPysoW9nLpR5c36RyCOjwukWEEJq+iS9SfA=CZn3j0ng@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Sat, 12 Jan 2013 19:16:51 -0000
Content-Type: multipart/alternative; boundary=e89a8f22bec1fbd36204d31c40a1

--e89a8f22bec1fbd36204d31c40a1
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 12, 2013 at 3:20 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Fri, 11 Jan 2013, Chris Larson wrote:
>
> >
> > On Fri, Jan 11, 2013 at 5:02 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> >       IMAGE_CLASSES += "sdcard_image"
> >
> >       but after i do that:
> >
> >       $ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES
> >       Parsing recipes..ERROR: Error executing a python function in
> <code>:
> >       NameError: global name 'imagetypes_getdepends' is not defined
> >       ... huge snip here ...
> >
> > image.bbclass defines the default IMAGE_CLASSES using ?=. Which
> > means if your distro doesn't define its own default value, you'll
> > end up with IMAGE_CLASSES only containing sdcard_image, not both
> > image_types and sdcard_image, and clearly both are required.
>
>   i don't see that happening with the raspberry pi layer.  if i
> configure for that layer sitting on top of oe-core, and just
>
>   $ bitbake rpi-basic-image
>
> this setting from the rpi layer:
>
> conf/machine/include/rpi-default-settings.inc:IMAGE_CLASSES +=
> "sdcard_image-rpi"
>
> produces this with bitbake-env:
>
> $ bitbake-env -r rpi-basic-image IMAGE_CLASSES
> Parsing recipes..done.
> IMAGE_CLASSES=" sdcard_image-rpi"
> $
>
>   the value of IMAGE_CLASSES clearly *doesn't* include "image_types",
> but the build works fine and i get the resulting SD card image in
> tmp/deploy/images:
>
> rpi-basic-image-raspberrypi-20130112091402.rootfs.rpi-sdimg
>
>   i'm sure i'm misreading what you wrote, but you can see from the
> output of bitbake-env that there is no "image_types" in IMAGE_CLASSES
> and the build works just fine.


Then that class likely does an 'inherit image_types' itself, thereby making
the implicit dependency explicit.
-- 
Christopher Larson

--e89a8f22bec1fbd36204d31c40a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Jan 12, 2013 at 3:20 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"im">=
On Fri, 11 Jan 2013, Chris Larson wrote:<br>
<br>
&gt;<br>
&gt; On Fri, Jan 11, 2013 at 5:02 AM, Robert P. J. Day &lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 IMAGE_CLASSES +=3D &quot;sdcard_image&quot;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 but after i do that:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 $ bitbake-env -r core-image-minimal IMAGE_CLASSES=
 IMAGE_FSTYPES<br>
&gt; =C2=A0 =C2=A0 =C2=A0 Parsing recipes..ERROR: Error executing a python =
function in &lt;code&gt;:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 NameError: global name &#39;imagetypes_getdepends=
&#39; is not defined<br>
&gt; =C2=A0 =C2=A0 =C2=A0 ... huge snip here ...<br>
&gt;<br>
&gt; image.bbclass defines the default IMAGE_CLASSES using ?=3D. Which<br>
&gt; means if your distro doesn&#39;t define its own default value, you&#39=
;ll<br>
&gt; end up with IMAGE_CLASSES only containing sdcard_image, not both<br>
&gt; image_types and sdcard_image, and clearly both are required.<br>
<br>
</div></div>=C2=A0 i don&#39;t see that happening with the raspberry pi lay=
er. =C2=A0if i<br>
configure for that layer sitting on top of oe-core, and just<br>
<br>
=C2=A0 $ bitbake rpi-basic-image<br>
<br>
this setting from the rpi layer:<br>
<br>
conf/machine/include/rpi-default-settings.inc:IMAGE_CLASSES +=3D &quot;sdca=
rd_image-rpi&quot;<br>
<br>
produces this with bitbake-env:<br>
<br>
$ bitbake-env -r rpi-basic-image IMAGE_CLASSES<br>
Parsing recipes..done.<br>
IMAGE_CLASSES=3D&quot; sdcard_image-rpi&quot;<br>
$<br>
<br>
=C2=A0 the value of IMAGE_CLASSES clearly *doesn&#39;t* include &quot;image=
_types&quot;,<br>
but the build works fine and i get the resulting SD card image in<br>
tmp/deploy/images:<br>
<br>
rpi-basic-image-raspberrypi-20130112091402.rootfs.rpi-sdimg<br>
<br>
=C2=A0 i&#39;m sure i&#39;m misreading what you wrote, but you can see from=
 the<br>
output of bitbake-env that there is no &quot;image_types&quot; in IMAGE_CLA=
SSES<br>
and the build works just fine.</blockquote></div><br>Then that class likely=
 does an &#39;inherit image_types&#39; itself, thereby making the implicit =
dependency explicit.<br>-- <br>Christopher Larson</div></div>

--e89a8f22bec1fbd36204d31c40a1--
