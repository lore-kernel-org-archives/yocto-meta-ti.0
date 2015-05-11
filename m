Return-Path: <b.hutchman@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33456E00961; Mon, 11 May 2015 11:10:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.hutchman[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D45ADE004F6;
	Mon, 11 May 2015 11:10:40 -0700 (PDT)
Received: by oift201 with SMTP id t201so111212017oif.3;
	Mon, 11 May 2015 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5HwmrsWD8cmjRA9e2P2gLcOd0+jgYxLtY4NXDpaqBok=;
	b=pRwmyZKR133b0Mkn9Q/IOPT8UZccWSXp+Su8GyLaUOGcBd9Wdi7gEWDyVAkgwRVC+J
	euPFC3TGdPedunYZQjII3QzcAWiIDNXW+unyQIJUjDzwqoi6925n1WZVDzshsLJr+vrW
	tYgRu8y6CsKqLsxM0Y7cIwKiGNiVWWRJJ/3b2FhTIdPuLZTnOvAUrGgXvcf3L7GQZo+p
	60vBhlbYFCZ0tI2lBeNiQK8seJoeUk1oXJ2hc3mb8gVHTj6pBxnk9+N7t0UxOsrP//9H
	Eg/uiRo3KzefwRmvEexnZ1Y7WnDbDDjEWKjnMS+2SlYsPf3RkP2JGhlm/t6EYbHBVe42
	1PeA==
MIME-Version: 1.0
X-Received: by 10.60.84.65 with SMTP id w1mr9252788oey.2.1431367839940; Mon,
	11 May 2015 11:10:39 -0700 (PDT)
Received: by 10.60.6.33 with HTTP; Mon, 11 May 2015 11:10:39 -0700 (PDT)
In-Reply-To: <554236CB.6000604@windriver.com>
References: <ce604c0c1a1d4131a72119dbecb97ab2@ASTRO-EX1.Bensberg.de>
	<553F90A3.9070501@windriver.com>
	<82ac67a7e46e416dbabdda01c42fc89a@ASTRO-EX1.Bensberg.de>
	<553FD83A.6040407@windriver.com>
	<4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
Date: Mon, 11 May 2015 14:10:39 -0400
Message-ID: <CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	=?UTF-8?B?U2NoYXVtbMO2ZmZlbCwgSmFu?= <J.Schaumloeffel@astro-kom.de>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Mon, 11 May 2015 18:10:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> It is plausible. But in theory, linux-dummy should still provide
> what you need (but since it doesn't build anything, there is
> no abi .. and no modules can be built against it) .. so the
> error isn't graceful.
>
> Bruce

I can confirm this same problem is happening to me.  I just updated
one of my builds from 1.7 to 1.8 and am also getting my rootfs to fail
due to no abi kernel version:

ERROR: No kernel-abiversion file found
(/home/hutch/yocto_1.8_davinci/poky/build/tmp/sysroots/am180x-evm/pkgdata/kernel-depmod/kernel-abiversion),
cannot run depmod, aborting
ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/hutch/yocto_1.8_davinci/poky/build/tmp/work/am180x_evm-poky-linux-gnueabi/core-image-nodeam/1.0-r0/temp/log.do_rootfs.23558
ERROR: Task 7 (/home/hutch/yocto_1.8_davinci/poky/meta/recipes-core/images/core-image-nodeam.bb,
do_rootfs) failed with exit code '1'

This is for an AM1808 build.  I'm using fido branch of yocto and
openembedded and master of meta-ti (since it doesn't have a fido
branch yet).

STAGING_KERNEL_BUILDDIR="/home/hutch/yocto_1.8_davinci/poky/build/tmp/work-shared/am180x-evm/kernel-build-artifacts"

I didn't do anything different in my local.conf than what I normally
do.  linux-dummy was also built with my last yocto 1.7 build and it
didn't have this problem.

Regards,

Brian

