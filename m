Return-Path: <sbaskana@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12278E00347
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2012 15:22:11 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so10996683obb.35
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2012 15:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=rVdsf/wHGeRbcqODjgZIBQUtsgdoU1dUmoR4pRgYJPE=;
	b=zz36hHu9NSehlnf05UGUM35TfQQkuoAmTwZ1Wl7Gx9lMM6LaoWG901WL3AhL36JrK2
	lkmNA/AgwyyzioR5JOV7vMeoNXA3mYeLUrI8eDGA3JPAwHUhQmxxCLjNLV+Kjbanuz1e
	3k34Aa/0hZUpPfS+uHPiWn7ERjk9qzu+RTorESLSxkqlZUdgZ9GkmxUThHjUk5FEGhhU
	tpq7So8j0yrmL/8B2teExzyHE85/GHZ7MaivY0Sej8QhJ/fcQh9msSPEZwSJTWATXkuu
	2PRWy8Niw6QCxyWrnyI2NvzWagCoLn81u+U8J1FGEZBNjYao4zdbFJ+Q8oZC/l3/KxXw
	UUJw==
MIME-Version: 1.0
Received: by 10.182.78.228 with SMTP id e4mr13809165obx.77.1346192528103; Tue,
	28 Aug 2012 15:22:08 -0700 (PDT)
Received: by 10.76.77.1 with HTTP; Tue, 28 Aug 2012 15:22:08 -0700 (PDT)
Date: Tue, 28 Aug 2012 18:22:08 -0400
Message-ID: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Sebasti=E1n_Bas_Kana?= <sbaskana@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Thu, 30 Aug 2012 10:35:05 -0700
Subject: Building a core-image-base
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
X-List-Received-Date: Tue, 28 Aug 2012 22:22:11 -0000
Content-Type: multipart/alternative; boundary=f46d0445170d6fd7f604c85adffc

--f46d0445170d6fd7f604c85adffc
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using Yocto/Poky and I'm trying to build an image for my Gumstix Overo.
I added the meta-gumstix layer and I can build the minimal image. The issue
is with the core-image-base. I get errors regarding the license of the
image recipes, so I used BBMASK to solve that. Then, an issue with netbase
appears, so I added it to BBMASK too. Then I get an error that says:

Nothing RPROVIDES 'fbset' (but
/home/sebastian/poky/meta-ti/recipes-graphics/libgles/
libgles-omap3_4.05.00.03.bb RDEPENDS on or otherwise requires it)

I tried to remove that error but then other failures arise and I just can't
get it to build. Any help will be really appreciated.

Thanks in advance!

Sebasti=E1n

--f46d0445170d6fd7f604c85adffc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I&#39;m using Yocto/Poky and I&#39;m trying to build=
 an image for my Gumstix Overo. I added the meta-gumstix layer and I can bu=
ild the minimal image. The issue is with the core-image-base. I get errors =
regarding the license of the image recipes, so I used BBMASK to solve that.=
 Then, an issue with netbase appears, so I added it to BBMASK too. Then I g=
et an error that says:=A0</div>
<div><br></div><div>Nothing RPROVIDES &#39;fbset&#39; (but /home/sebastian/=
poky/meta-ti/recipes-graphics/libgles/<a href=3D"http://libgles-omap3_4.05.=
00.03.bb">libgles-omap3_4.05.00.03.bb</a> RDEPENDS on or otherwise requires=
 it)</div>
<div><br></div><div>I tried to remove that error but then other failures ar=
ise and I just can&#39;t get it to build. Any help will be really appreciat=
ed.</div><div><br></div><div>Thanks in advance!</div><div><br></div><div>
Sebasti=E1n=A0</div>

--f46d0445170d6fd7f604c85adffc--
