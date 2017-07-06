Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB764E00B9D; Wed,  5 Jul 2017 20:30:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.67 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14BB9E00ACF
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 20:30:37 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id t72so640971lff.0
	for <meta-ti@yoctoproject.org>; Wed, 05 Jul 2017 20:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mb/bXSq9OqBW04EtypYdvzMt15yKKx3fYDbpfeVHoo0=;
	b=WsnHA+gWuEyG1Gb6NtDBKEkbp/SJPiUM3uwP5aqLr6a7BVPd8x+7o8SQ3RSz98e8gA
	hDrhKpHYqRV+UaLOb4Qw6wiW08Uza2OuX6nr5bxZWa+BVGh7GLvO/Eo921fzn4xjNP+H
	I3gfwKLONqNL3EuWMxZASr+SRTCGnGCBizgVt5Vv/NzNz2nhosj4PhE2WL7kvxvsAfsS
	Ne9NKX7cBmDXNc64+v1cqbKlFwCA6AmawWingH4dnZbkdg0u5cZ8Z2kWb+1HwzUL3vMa
	vFw3kmvzmv8AmGHrqbDlw5ogoEoxIebQdwK0zWhx15K94kFf+n3G1t2YSi5ILj+GuNya
	un2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mb/bXSq9OqBW04EtypYdvzMt15yKKx3fYDbpfeVHoo0=;
	b=kMvq2sUY0qCZKdcFA6sq6oi/OyyMFulSy/MePRj/3VK2HoRxsxgQQz1U+C117GbL/S
	hp1AS/8Oqvp6wfVVyk+9SasfrAcQP0FaTz29z18g3MDlgwvD7uJaW8fXgN5n5HDsfNFT
	jk8iK+lujREw9fMl0DglgPb038aoJ0WOn9vImc5AW2QBlqJm8kl3+TcQCOXa+CVloG2x
	m81xAaTSrQgaktKXpPRtHNx6ZdXzJWe8X8VOteiWxpP8caw48ihxFrUwgPH/Ik0nf/UB
	HkaqdxfEJSy7Fwj8AWXklad+I/2XXOjRTcJqwz47SBOr6FATki0DD05BNAfbf1Bi/IOq
	4PLA==
X-Gm-Message-State: AKS2vOxnAl2xMDUUJFrdPUDApYZAqP+QHnA6lvdJg4CnUEMnPfZrZ4yk
	rCgFxOVIdDsZWvqS4LFVilPPzmiRpA==
X-Received: by 10.46.80.93 with SMTP id v29mr9691651ljd.97.1499311836589; Wed,
	05 Jul 2017 20:30:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.115.20 with HTTP; Wed, 5 Jul 2017 20:30:05 -0700 (PDT)
In-Reply-To: <CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
	<CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
	<CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 5 Jul 2017 22:30:05 -0500
Message-ID: <CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
To: Riko Ho <antonius.riko@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb
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
X-List-Received-Date: Thu, 06 Jul 2017 03:30:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 5, 2017 at 7:03 PM, Riko Ho <antonius.riko@gmail.com> wrote:
> Dear Meta TI Team Member,
>
> I want to use SPI0 and used kernel from yoc to. I have added SPI0 node patch
> on bone*.Black.dts. I ll send later on for verifying. I m not on my dev
> computer now.
>
> I can get dev/spidev1.0. did a loopback. It s running. But all 0000. There s
> a bug when it was started booting. I ll show you later.
> I ve checked the cable. Tested with Debian image, was working.

This fixes that bug: (aka the spi maintainer believes what we are
doing with the spidev node is wrong..)

https://github.com/RobertCNelson/ti-linux-kernel-dev/blob/ti-linux-4.4.y/patches/reverts/0001-Revert-spi-spidev-Warn-loudly-if-instantiated-from-D.patch

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

