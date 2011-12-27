Return-Path: <pabigot@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70D0CE0054C
	for <meta-ti@yoctoproject.org>; Mon, 26 Dec 2011 18:55:28 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wibhq4 with SMTP id hq4so6622847wib.35
	for <meta-ti@yoctoproject.org>; Mon, 26 Dec 2011 18:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=lwcsSqvMoBPAQpikyhDmzjg2JKMQjXgZkFhfBho/Ts8=;
	b=CUrfwHNBdeCLdnkvNxREUZS9I+Ie4KGoiJt9aKMjTlnew1cVo7JKjNv398GJmgSfy7
	u9A0qd965gEuWw/qvBsDrAMtaY8AyaUw6aWamFcLF/tyuDdZZLOJAUtRXqXO/jS7npb0
	JIJSi+ewlBYbPdbdb2/QPUdDYWOxePw158Fds=
MIME-Version: 1.0
Received: by 10.180.94.97 with SMTP id db1mr57561438wib.16.1324954526931; Mon,
	26 Dec 2011 18:55:26 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Mon, 26 Dec 2011 18:55:26 -0800 (PST)
In-Reply-To: <cover.1324558731.git.otavio@ossystems.com.br>
References: <cover.1324558731.git.otavio@ossystems.com.br>
Date: Mon, 26 Dec 2011 20:55:26 -0600
X-Google-Sender-Auth: x3jWzr91VzryVLy4aC4tRpKfric
Message-ID: <CAPOJ94Ne2H81gRQfoD25Z+c7w_FKR=qshESfpRtwUu0mQ+AmUA@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3 0/3] Rewrite sdcard_image.bbclass
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
X-List-Received-Date: Tue, 27 Dec 2011 02:55:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 7:00 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This version of patches uses mtools to copy the files onto the fat
> partition avoiding the problems from dosfstools in previous versions.

For my cloud9-image build the mcopy aborts with:

 Total number of sectors (84030) not a multiple of sectors per track (32)!
 Add mtools_skip_check=3D1 to your .mtoolsrc file to skip this test

Changing the calculation of BOOT_SIZE to round up to a multiple of 32
gets past that.

The disk geometry is bizarre.

The image doesn't boot an xM (just prints 60 to the console and
hangs).  I thought this might be because MLO isn't the first entry in
the vfat partition (the recursive mcopy puts some documentation files
first), but correcting that doesn't help.

Peter

>
> The following changes since commit c00b5df3b85b3badbd268e376c0a19fab19cc4=
f3:
>
> =A0linux-ti335x-psp 3.1: disable whiteheat firmware to unbreak build with=
 make 3.85 (2011-12-21 15:33:36 +0100)
>
> are available in the git repository at:
> =A0git://github.com/OSSystems/meta-ti master
> =A0https://github.com/OSSystems/meta-ti/tree/master
>
> Otavio Salvador (3):
> =A0sdcard_image: rewrote to avoid using loopback and mount/unmount
> =A0ti-hw-bringup-image: adapt to newer sdcard_image class
> =A0cloud9-image: adapt to newer sdcard_image class
>
> =A0classes/sdcard_image.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0181 ++++=
++++++------------------
> =A0recipes-misc/images/cloud9-image.bb =A0 =A0 =A0 =A0| =A0 =A06 +-
> =A0recipes-misc/images/ti-hw-bringup-image.bb | =A0 =A03 +
> =A03 files changed, 70 insertions(+), 120 deletions(-)
>
> --
> 1.7.2.5
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

