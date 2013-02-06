Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 951A2E0047F
	for <meta-ti@yoctoproject.org>; Wed,  6 Feb 2013 00:34:24 -0800 (PST)
Received: by mail-ve0-f169.google.com with SMTP id 15so948503vea.0
	for <meta-ti@yoctoproject.org>; Wed, 06 Feb 2013 00:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9QFdys1je1rGWU+wcn8u4djeyM1Csg7+cLUPHk8oopU=;
	b=csNXb4c+a4NWZe1u6o1sSSUXrLTaGf9HqGwagQSerCBPvMd3IiuX2XSYiEfI2aOJAV
	OSalc/RcrS42HisT7t23lWqIdNHu2/0W4twb4/QwaQeDMjtm/wazcZVfzenxFrCo44XP
	dxCGnosY9DDK89NjQeS2zEW5d+DA2FLl+tOdMRoTh/pwqnrT0JMsToM3ocQOPrdRiUYU
	9+ka98c1Fo+sQoGpWbgANZF2JSXTQ4kO0uFNxuNWZ55RkUjxqIHOsHGmhG5D2dRcOvhd
	iKgG4KF3ETy3t4dT5Tu75lSZbgNv9cgIwcxv1HOPfyvoqOzNqaNqwrFP+6Rwafi95PVY
	5t3A==
MIME-Version: 1.0
X-Received: by 10.52.28.101 with SMTP id a5mr27669423vdh.92.1360139663699;
	Wed, 06 Feb 2013 00:34:23 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 6 Feb 2013 00:34:23 -0800 (PST)
In-Reply-To: <1360133872-10658-2-git-send-email-fcooper@ti.com>
References: <1360133872-10658-1-git-send-email-fcooper@ti.com>
	<1360133872-10658-2-git-send-email-fcooper@ti.com>
Date: Wed, 6 Feb 2013 09:34:23 +0100
Message-ID: <CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: fcooperjr27@gmail.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 06 Feb 2013 08:34:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 6, 2013 at 7:57 AM,  <fcooperjr27@gmail.com> wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
>
> * Add version 4.08.00.01 of the SGX modules.
>
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2:
> Update SRC_URI link to use official SDK download link
>
>  .../omap3-sgx-modules_4.08.00.01.bb                |   56 ++++++++++++++++++++
>  1 files changed, 56 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
>
Just a question: With which kernel version did you test that - because
4.05 currently used need patching for kernels > 3.3 for me.

Andreas

