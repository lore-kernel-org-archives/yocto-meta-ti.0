Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFFEBE00718; Wed,  5 Jul 2017 10:26:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.46 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15D5BE00349
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 10:26:45 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id h22so138445481lfk.3
	for <meta-ti@yoctoproject.org>; Wed, 05 Jul 2017 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8KzZrgLCwD5VSRDI4ahvXEWfrV5m0nsmusb2n0LK5pg=;
	b=PbQ+ZhAMinompWV2bo82Lp1KwSQV41El7sqKJa45dSXImR586Dddp0DqdpUH1+Tvuf
	p1TYbG9tXXn3Zo6A6uAauPKRAoZlzMOW7i7Fw8Vwz8daUnlODdAvJ++255yuO9ZHQudI
	9j2hp3KKuHth5elYgTfMIzozeWVcjfMrcfOhURFubtHr9Q/1e1w4sK56mOASRfGr9pKL
	Ot965CCCs73UGxOzI2wPw4EfAJr1DN3sLTxWWOVxDLNJOZhKZ2TjJpBcTwmHpeJm5zL7
	Oqi7N1penYZuAt7VnT/mtD4uSJvhutdNIPgNb1lUy1ZaYTavHNZhxd1m1lI8ijnx0mYA
	GVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8KzZrgLCwD5VSRDI4ahvXEWfrV5m0nsmusb2n0LK5pg=;
	b=qxrI8sb0pH8yyYtfTo45PlFq2CLzZnDg9OkaGnInaCyk35YI5bc2tqE/A6xSlvn+kr
	6gI84qwMCpewPMTMSqTKsqLJtEdnRIKwz6uFKAyydy6SqJmnvpifXGIA+fmFzDrT+NpK
	SzwoMPIqiM0BenqR4wnq0a3M5C+UmwR1P0b9EmRBFXGnhqjtmz9xYxYiBIQV/sMTJzz5
	b7F9vPrDkMdVBPvt+pxNc1TPwUiz01ZwNL4Ihtx+/uwLefQhFtxx1rOtjdbYRx6T72pl
	EXUiDL7JePbpKCNRsVTpUAPdkM7hHrcNsq+W0znGN44qAhFJxvgCA3YTzVFpXW2M/0l8
	lYzQ==
X-Gm-Message-State: AKS2vOxZbw+ph+to/5pWz/SG8dawguEbt4lI7Dp8B11dYf5i/VL/dyJW
	C79bHg4FBRMzoKP4Xi0J/hmlrYiRCg==
X-Received: by 10.25.181.196 with SMTP id g65mr15576436lfk.108.1499275604461; 
	Wed, 05 Jul 2017 10:26:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.115.20 with HTTP; Wed, 5 Jul 2017 10:26:13 -0700 (PDT)
In-Reply-To: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 5 Jul 2017 12:26:13 -0500
Message-ID: <CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Jul 2017 17:26:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2017 at 9:58 PM, Riko Ho <antonius.riko@gmail.com> wrote:
> Dear meta-ti Team Member,
>
> Is it possible that I use this dtb with beagle yocto kernel ? if it is, how
> to do that ?
>
> loading /boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb
> --

Riko,

You can try loading that *.dtb with meta-ti's kernel, but it won't use
the kernel overlay features built-into the *.dtb as the meta-ti tree
lacks those out-of-tree-in-development-etc overlay patches.

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

