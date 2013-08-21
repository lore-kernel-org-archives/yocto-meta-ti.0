Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4B23E00747
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 21:11:55 -0700 (PDT)
Received: by mail-pb0-f49.google.com with SMTP id xb4so1214674pbc.36
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 21:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Vdhd53Q6joTlHOFcdYQP+mMJnfIy60FFpZ8brG9c5p0=;
	b=PLKXSFFpb1w5dLb086ktu9fHZR8KVtFasIQXYTAJfahM8propeZ9hBHpY4OOoTsmh+
	1Q88NPPoAeQF3/pzQQ7m3QwxSmO6BHuELwjzP1pA6LWtkpOAhljL3228w+qM4V9A7iKn
	NvnmJtsSD9d/7YO7nJElv6ijvezEhUQDKOq73tfPUC32s19RAPm/OVJmtLFMFLRaV/0x
	LMfQHWqjy95KvKwHcqMNXesAY2nyd1Uy9HvyxOhzSePdGAKJZB8P/seyhrs39b0Jd7jG
	agGPXqsLmnE0ipK+5qthsxhtlx4kmJkW4I52h5OYsZ5P0PY/sTsdkhShVIidUc87OJjn
	LRnw==
X-Received: by 10.67.5.132 with SMTP id cm4mr4508pad.186.1377058315266;
	Tue, 20 Aug 2013 21:11:55 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	tr10sm5550297pbc.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 21:11:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
Date: Tue, 20 Aug 2013 21:11:57 -0700
Message-Id: <3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Wed, 21 Aug 2013 04:11:56 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D5CE7906-E96A-4EA7-BD8F-182B0FFAB448"

--Apple-Mail=_D5CE7906-E96A-4EA7-BD8F-182B0FFAB448
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> First question.  I looked at my =
poky/meta/recipes-kernel/linux-libc-headers dir of a denzil checkout =
that last had c6a816x-evm support to use as kind of an example/guide.  I =
see recipes for linux-libc-headers_3.2.bb and =
linux-libc-headers_3.0.8.bb.  Do I need to create a recipe for 2.6.37 =
and set the SRC_URI for a 2.6.37 commit so that my rootfs packages will =
be built against headers that match the version of the kernel I'm using? =
 It looked like linux-libc-headers.inc has some kind of check to decide =
on which headers to use (3 or 2.6) but I don't quite follow how it works =
yet.

yes you need to add a recipe for linux-libc-headers_2.6.37=85.
and also make sure that your distro/machine chooses this for preferred =
provider for linux-libc-headers

>=20
> Second question.  When I try to bitbake core-image-minimal after =
adding in my kernel (a tar.bz2), it builds but the do_package phase gets =
errors:

> =
arm-oe-linux-gnueabi-objcopy:/home/hutch/oe_core_beagleboard/oe-core/build=
/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/p=
ackage/usr/src/kernel/image/usr/src/kernel/scripts/mod/mk_elfconfig: =
File format not recognized

what is that file ? can you run it through file cmd and find out what =
arch its targeted for ? if its a host tool then remove it from install =
location


--Apple-Mail=_D5CE7906-E96A-4EA7-BD8F-182B0FFAB448
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><blockquote type=3D"cite"><div class=3D"gmail_quote"><div>First=
 question. &nbsp;I looked at =
my&nbsp;poky/meta/recipes-kernel/linux-libc-headers dir of a denzil =
checkout that last had c6a816x-evm support to use as kind of an =
example/guide. &nbsp;I see recipes for&nbsp;<a =
href=3D"http://linux-libc-headers_3.2.bb/">linux-libc-headers_3.2.bb</a> =
and&nbsp;<a =
href=3D"http://linux-libc-headers_3.0.8.bb/">linux-libc-headers_3.0.8.bb</=
a>. &nbsp;Do I need to create a recipe for 2.6.37 and set the SRC_URI =
for a 2.6.37 commit so that my rootfs packages will be built against =
headers that match the version of the kernel I'm using? &nbsp;It looked =
like linux-libc-headers.inc has some kind of check to decide on which =
headers to use (3 or 2.6) but I don't quite follow how it works =
yet.</div></div></blockquote><div><br></div><div>yes you need to add a =
recipe for linux-libc-headers_2.6.37=85.</div><div>and also make sure =
that your distro/machine chooses this for preferred provider for =
linux-libc-headers</div><br><blockquote type=3D"cite"><div =
class=3D"gmail_quote">
<div><br></div><div>Second question. &nbsp;When I try to bitbake =
core-image-minimal after adding in my kernel (a tar.bz2), it builds but =
the do_package phase gets =
errors:</div><div></div></div></blockquote><br><blockquote =
type=3D"cite"><div =
class=3D"gmail_quote"><div>arm-oe-linux-gnueabi-objcopy:/home/hutch/oe_cor=
e_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/l=
inux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scri=
pts/mod/mk_elfconfig: File format not =
recognized</div></div></blockquote><br></div><div>what is that file ? =
can you run it through file cmd and find out what arch its targeted for =
? if its a host tool then remove it from install =
location</div><br></body></html>=

--Apple-Mail=_D5CE7906-E96A-4EA7-BD8F-182B0FFAB448--
