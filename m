Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BC5AE006D2
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 07:47:50 -0800 (PST)
Received: by mail-la0-f45.google.com with SMTP id ep20so1925103lab.18
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 07:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=o4hm2dejF3s/CIifPbQCBefbAhucWBIB3rqCNgUIPfE=;
	b=N1Nbpaw+9XzN/wUMKlAshEIY4jtMtyTUfd/nqVHILl1LaiazGFoYn8VzHV8ff691hA
	w3mHA0uRtXk/eCEgPGhzoiDiGuIGcmpBugwC4R0zKag5ArI/PNizfqucuIgQq0+I6on+
	0+iVBltMBx61yyJiGdaK5li9fWHKD/6AhmCalvHetWMfJdCjeQr589Ww2IAjaSNVkpAS
	ONMd0vFvC8j34K8tRM0vSVqaDoRvdcBYk2ICGSuGBF832/JMV5UvVRl4Rz7pHGmq8XRL
	BsmKUKcquH5qrn51RBHsclEZIXcE2/5jFe3UPnkrpJT7C41cW6Sd9fTDi/JibTeN/O3C
	b8wg==
Received: by 10.152.111.102 with SMTP id ih6mr14192195lab.20.1357919269573;
	Fri, 11 Jan 2013 07:47:49 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Fri, 11 Jan 2013 07:47:29 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301110652110.10214@oneiric>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<alpine.DEB.2.02.1301101008200.7994@oneiric>
	<CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
	<alpine.DEB.2.02.1301110652110.10214@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Jan 2013 08:47:29 -0700
X-Google-Sender-Auth: LqV59SFaAGACr16lPG8eXAFuA6c
Message-ID: <CABcZANmH2DVSoaWz8Ob66QPjtt79cRjpEeQ9EuAj4uwTOU9WBA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 11 Jan 2013 15:47:51 -0000
Content-Type: multipart/alternative; boundary=f46d04088f7bb2555c04d3053701

--f46d04088f7bb2555c04d3053701
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 11, 2013 at 5:02 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> IMAGE_CLASSES += "sdcard_image"
>
> but after i do that:
>
> $ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES
> Parsing recipes..ERROR: Error executing a python function in <code>:
> NameError: global name 'imagetypes_getdepends' is not defined
> ... huge snip here ...
>

image.bbclass defines the default IMAGE_CLASSES using ?=. Which means if
your distro doesn't define its own default value, you'll end up with
IMAGE_CLASSES only containing sdcard_image, not both image_types and
sdcard_image, and clearly both are required.
-- 
Christopher Larson

--f46d04088f7bb2555c04d3053701
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jan 11, 2013 at 5:02 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":3">IMAGE_CLASSES +=3D &quot;sdca=
rd_image&quot;<br>
<br>
but after i do that:<br>
<br>
$ bitbake-env -r core-image-minimal IMAGE_CLASSES IMAGE_FSTYPES<br>
Parsing recipes..ERROR: Error executing a python function in &lt;code&gt;:<=
br>
NameError: global name &#39;imagetypes_getdepends&#39; is not defined<br>
... huge snip here ...</div></blockquote></div><br clear=3D"all"><div style=
>image.bbclass defines the default IMAGE_CLASSES using ?=3D. Which means if=
 your distro doesn&#39;t define its own default value, you&#39;ll end up wi=
th IMAGE_CLASSES only containing sdcard_image, not both image_types and sdc=
ard_image, and clearly both are required.</div>

-- <br>Christopher Larson</div></div>

--f46d04088f7bb2555c04d3053701--
