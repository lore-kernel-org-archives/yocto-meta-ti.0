Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B18EE00292
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:59:48 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so1855568vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=WyccLNDO9Bdn/gFJJGOd6DQgiMy/GuQczP+7lJd485M=;
	b=XtiLMJKbHhJwonLGQnX6O3OQnJCqov3wJNwGmdiBCwn2bvxlOTZr8YyvOd6mA0UPFO
	jIN60GALTaQdSpS7S854DebE+b+lnNOP6sjuhX9h/i0LbyJWcgH1cGtglWauFSzBwp5Z
	crpeW4qwvwEtG+Lg9TOqx6Fu2Q60kDU8rnH8zhm39f7+3pFzPSu2duqZjzqXwNR1bHKX
	sHC+N5PLAdEio0u1m73byfCRNEPW4ZwWr/oxvv6ZbVHj03aQULI3y6/4fM7/1AZbywmZ
	5Dhdi++wPgXXn3vMiNsMM0Sm2hmRV5cjI71FboCMpBTzZyBucGklmEOLHwnEZ+QBZ0HE
	i7Ag==
MIME-Version: 1.0
Received: by 10.52.98.163 with SMTP id ej3mr225255vdb.37.1349953187792; Thu,
	11 Oct 2012 03:59:47 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 11 Oct 2012 03:59:47 -0700 (PDT)
In-Reply-To: <CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
Date: Thu, 11 Oct 2012 12:59:47 +0200
X-Google-Sender-Auth: O3551PMQ-UH5WaMa0bKXjS8pbs8
Message-ID: <CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Nicolas Dechesne <ndec13@gmail.com>
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
X-List-Received-Date: Thu, 11 Oct 2012 10:59:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 10:22 AM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
>> +
>> +# 2012/09/26: pvrvideosink: Limit size to 1080p as it is a hardware limitation
>> +SRCREV = "3eb68bf5bcd79d490e35d29f262a0a9d84da36ff"
>> +
>> +SRC_URI = "git://gitorious.org/gstreamer-omap/gst-plugins-bad.git;protocol=git;branch=v0.10.23+ti"
>> +
>
> i would expect that it might be cleaner to archive the patch series,
> than changing the SCR_URI... that's just my guess.

Last time i tried this i noticed that the patch list was huge so it
was easier to just use that tree. I don't know what's the status now
but from a quick view it seems the same now.

Enrico

