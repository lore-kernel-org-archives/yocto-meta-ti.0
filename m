Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CC5AE00C05; Sun, 31 Jan 2016 21:22:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FF40E00BFF
	for <meta-ti@yoctoproject.org>; Sun, 31 Jan 2016 21:22:52 -0800 (PST)
Received: by mail-io0-f181.google.com with SMTP id 9so66438160iom.1
	for <meta-ti@yoctoproject.org>; Sun, 31 Jan 2016 21:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=e3ZGAm7h6jvZk1dKB5JqSY3j961mJeSWWwsTWFjocuo=;
	b=UKhKqkW8RZvXa1naHrGeDAFLDPfM8PiYGg0azWgfgeIREKSt2lfo4jTWK931IQgc9l
	tVKTPBwAJJkMWtbRTR5AipGj0B7R6ur+MGq6JOmp75Uu6wj9Nuqv94XEcFg/XVPVK4lt
	cpkWPj4zLFkFwTX6EogONHlWnIDldGAvl+SZTtN8wJF6GJj2VgzJKzBKYpH94LWpi2dc
	K15oVCYKhsrWEUWLTshRJ5uLJ2BOYDr5uHL2xe+tP20I0IiaD4hXkewYCFHAi3kjFvYn
	EzpuH+iF4w2IpQCew9iwlrK3qb9p+dVhyX8PpbnJlPpbVfxt9PNZE7VVNdH5WeAjlVfF
	GkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e3ZGAm7h6jvZk1dKB5JqSY3j961mJeSWWwsTWFjocuo=;
	b=NVhmnvVE4vhm7FRXC55nEWDuhkzvD3VzdPaOoZJj632U3fvZD8WMZ5iX8pd0i72YOb
	wA7i8A3aKU7oSi8durO081PsCkM3sAMuG4DjLmi0o7swdV99F9TyFl4CkikULDkAJV6Y
	Ss6MGBM1ZIGdGUVTC8FD3jDaDR93q5xeatVAK4z36+D3HeC1BHQ4vQEOJ+rHr8DEWaOX
	4S1M8geaOobfekuQiF9t1Wt6XtlmN2rN4SGJO7vJLeeX8RZ9LmzjtHILT0bAvdqLmYSq
	lkVT9rIqV6OqJY4GcDbtpYlwC3iM/gNHS5j9vFb4S2GB0DdIwoqDj0aBzChtePX/Lv/R
	U9qg==
X-Gm-Message-State: AG10YOToPNP3d97qvb2TxZGee4Y1YvbFFYk0Ks2bU/5QgGRIHslxCdKQwcBoKeW16fjDRZ7FCVq2Eb2UkgYzjw==
X-Received: by 10.107.9.211 with SMTP id 80mr14684201ioj.112.1454304172330;
	Sun, 31 Jan 2016 21:22:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Sun, 31 Jan 2016 21:22:22 -0800 (PST)
In-Reply-To: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
References: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jan 2016 21:22:22 -0800
Message-ID: <CAMKF1sop2mXSyhr3Mu3LaLQuc-X=qiUGHnyNkyyb48SHO9+0rg@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Problem to write core-image-minimal of AM437x-evm on SD card
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
X-List-Received-Date: Mon, 01 Feb 2016 05:22:56 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 31, 2016 at 8:19 PM,  <winiston@futuraautomation.com> wrote:
> Dear,
>
> I have successfully built core-minimal image of AM437x-evm using poky. The
> following files have been created under /tmp/deploy/images/am437x-evm
> directory.
>
> core-image-minimal-am437x-evm.tar.bz2
> core-image-minimal-am437x-evm.tar.gz
> core-image-minimal-am437x-evm-20160127052452.rootfs.tar.gz
> MLO
> MLO-am437x-evm
> u-boot.img
> u-boot-am437x-evm.img
> zImage
> zImage--4.1.15+git0+b7b07f10f6-r3f-am43x-epos-evm-20160127052452.dtb
>
> and many more files have been created. I wanted to write it on the sd card.
> How do I copy the images to sd card? I did not find any command to write the
> image. Kindly help me out to write the image on sd card. I could not go
> further to develop my project. I would be very thankful if you give me
> detail procedure to solve this issue.

you can use wic to generate sdcard image and then dd it into SD card
secondly you can use angstrom sdcard scripts to create your SD card partitions
and then copy MLO, uboot to boot partition and untar rootfs into
second partion manually

>
> Awaiting your valuable reply. Thanking you.
>
>
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

