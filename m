Return-Path: <daniel@fooishbar.org>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42237E0049B
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 07:08:30 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2565652vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 07:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=Sw9JVVDA+KZlwUG2ZpjS8/iB+VrMhbex4v80pf34CmM=;
	b=KdFrRpcVat7sKXiSY/mkR+tmaq0gNWthGPAqNm/P7bMXD3u1GKfY93rXr0bavZkt0A
	mU2XYBxYwrBeCWkAAN/sSlfPkvSQ2ClCCp6YRTZRftstFS1RrrOQNTm9o5jiyyLHRZot
	yWKqby00VxJnaQ+Ysa+u92jCF//3Vw6gcRgkbbmaOfr/OLvYRyd0hM9fkFYMv9UkuSBt
	JUjhXgIQ4hxqNEI0KhcSfL6Tteb6LpS4Zkg6temwykXazvGqJwtpumpFATa9wZ7rQ00q
	YzqGioiu64X7MFz/92AlKHJwcyH+SYOwZsCUkGWkqmOLnuRE4axJiHeMiJsDuRh0LxVZ
	VkdA==
MIME-Version: 1.0
Received: by 10.58.59.36 with SMTP id w4mr555734veq.26.1349964509548; Thu, 11
	Oct 2012 07:08:29 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Thu, 11 Oct 2012 07:08:29 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <5076C554.6060200@mlbassoc.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
	<5076C554.6060200@mlbassoc.com>
Date: Fri, 12 Oct 2012 01:08:29 +1100
Message-ID: <CAPj87rMrJ4D6fnY4kw5dBkogzqjDCVPiccGzM3TpWCWkN9FzCg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQmq0YjMINeDjfGGhAtmRknQmUrID8F3ATWnVVqcDbQSIIkZ3PC9eb9/E1dwG+PYKdJHdhJr
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Thu, 11 Oct 2012 14:08:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 12 October 2012 00:10, Gary Thomas <gary@mlbassoc.com> wrote:
> BTW, Does anyone know when OE-core or meta-openembedded will have support
> for gstreamer-1.0?

I've got a tree which adds GStreamer 1.0 support, but have held off on
submitting it while Yocto's in release freeze.

Cheers,
Daniel

