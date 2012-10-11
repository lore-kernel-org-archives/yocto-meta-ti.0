Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CD98E01457
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:49:24 -0700 (PDT)
Received: by mail-bk0-f48.google.com with SMTP id ik5so940141bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=v8Cg6hdJrpZcL6k/X27b3VDkvj3rtoPrfXVmU0aFRT4=;
	b=RjaELKtr3nJsT8mDIy2Qy7HvCQ83AnI3Sc224cDoDoJFfaihqhPEeKtNY9r/OQcGT3
	f5pscI4v/drX+kLk7U6jy/gSPXBBrjQLcw2qjYhKNTkJsfq2kaby+xKATcofUdDbebJI
	nBRdrEVmzcpNVyhh/di5vkCxe1rQFn8YOp95RmKoRI4EpxJ1yHWjMUZHA+qwtyG27FHw
	/ygIn3RF0zWPwF3rhMAOQYMbvksBycsQIsnx37Z+gakBG8Yz05JZYyjVT0LIyjP86ye6
	W+iecvsETPwxM6aWtum+W18t1qv/O4GAGazGtd/IlGUmWGAGFZKSxd9c1oPIySK5KGGW
	U9rw==
MIME-Version: 1.0
Received: by 10.204.130.21 with SMTP id q21mr363378bks.5.1349963363473; Thu,
	11 Oct 2012 06:49:23 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.204.145.71 with HTTP; Thu, 11 Oct 2012 06:49:23 -0700 (PDT)
In-Reply-To: <5076C554.6060200@mlbassoc.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
	<5076C554.6060200@mlbassoc.com>
Date: Thu, 11 Oct 2012 15:49:23 +0200
X-Google-Sender-Auth: mm424Aje7gtgAFIsJ6BBpoojXec
Message-ID: <CA+2YH7t58hRquaOJpyAOdU_j=HZNHs12OqivhDhbiAVOY2H7fg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Gary Thomas <gary@mlbassoc.com>
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
X-List-Received-Date: Thu, 11 Oct 2012 13:49:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 3:10 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-10-11 07:00, Nicolas Dechesne wrote:
>> well, we maintain these trees in the team... these patches won't go
>> away until we move to gst1.0. with gst1.0, gst-ducati will run with
>> vanilla gst release
>
>
> Does that include the plugins as well?
>
> Is there a schedule for this change?
>
> BTW, Does anyone know when OE-core or meta-openembedded will have support
> for gstreamer-1.0?

...and what will happen to omap3 gstreamer-ti?

Enrico

