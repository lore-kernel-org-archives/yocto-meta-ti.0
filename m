Return-Path: <ebutera@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF6AAE01423
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 06:37:03 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id tp5so2991863ieb.36
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fgamTEagMOOUyNIldJFCpezRB692mDgBTl/8fXAUHcQ=;
	b=U44sD026EaivqzcIE8zweHRRgAIvighN20Pp+RzfADvStIro1pbE7gDfFnulkqPTuI
	Gsl40ZkzQDJE/3KlK08tFgOp4s5ix06KcQLapO2urXH+xx2twE091sjC21aaYBZ2Cic7
	8O8vI0Q/VEkb+NUfBMzpgcN+Tl6anW+GJ+/36FeTRxFEhRZOvQSV3pwbskPjA2Wa3Hey
	pzMl3TKNIAoqWBaWiyJIYORfv/LFtRbB4zWf2ePlMrRfa8/GvroY4dBI6BRgm67JjC+t
	i0FOqsMavXG4aNVCNvMdDewYYB+wLHQkXRZ8Y/HxkJpqSEfaTvzlR229yV5yj1DsZ63T
	7kOg==
MIME-Version: 1.0
X-Received: by 10.50.13.39 with SMTP id e7mr2651867igc.97.1364218623441; Mon,
	25 Mar 2013 06:37:03 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.231.247.12 with HTTP; Mon, 25 Mar 2013 06:37:03 -0700 (PDT)
In-Reply-To: <1364216750-29038-1-git-send-email-Chase.Maupin@ti.com>
References: <1364216750-29038-1-git-send-email-Chase.Maupin@ti.com>
Date: Mon, 25 Mar 2013 14:37:03 +0100
X-Google-Sender-Auth: Tun7Y65l5JuLYUXZBs_KMiZbkE0
Message-ID: <CA+2YH7s7mmU0-uxSnQ0na2BE1oULz5Ouy5FX8qTBi=kX7DrGxQ@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Chase Maupin <Chase.Maupin@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: Add panda dts file as supported DTS
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
X-List-Received-Date: Mon, 25 Mar 2013 13:37:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 25, 2013 at 2:05 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> * Add the omap5-panda.dts file as a supported DTS to be built.
>   This file is for use on the panda and uEVM boards.

The name omap5-panda seems a bit misleading to me. Or maybe there are
plans for an omap5 pandaboard?

Enrico

