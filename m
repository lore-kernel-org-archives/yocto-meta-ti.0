Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 461A7E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 12:16:51 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so3086202vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N+uBL4Rv5Dv0h8Dv9OvL1yczl+JcpK/FeJh8/M+DGK8=;
	b=ftiNe6LsIS3TobCa+a2bWqi+D+ZE4cStD9v8ImPtsOH9J/v/a43lwk1wqo3P6AfX1t
	ezFxtJ75tjECSi7wYLZviAqb3hes9Y+kbzdie+h/UwStVsGL+c1QFPdYAsk5CGIeDahd
	G78Mjn0PDMoreRg2i1N/iTyZuS4fImvR5E2eX0rB0yEX5ev+KWRTPlDa84XPS4SC5vhm
	H0NsmzM/rZS0oKAZMXaF1VPUHWYzW/r2vpkvNf1QayxU+hkGb1Px/4s++qzq0vLd8cS1
	4xoKm70FWao+cFKjHaOOQdXmtzDvU1TU2XHMbfMBWs54Nj5JbGmn8MAPg3yFc3ahryMp
	WPJw==
Received: by 10.58.94.109 with SMTP id db13mr1091673veb.39.1349983010295; Thu,
	11 Oct 2012 12:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 12:16:30 -0700 (PDT)
In-Reply-To: <5076D6CC.5010303@mlbassoc.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
	<5076C554.6060200@mlbassoc.com>
	<CAPj87rMrJ4D6fnY4kw5dBkogzqjDCVPiccGzM3TpWCWkN9FzCg@mail.gmail.com>
	<5076D6CC.5010303@mlbassoc.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 21:16:30 +0200
Message-ID: <CAOT3mi+Ad=aB_mc11DUmybMvEcySnGUzs6rDke+-mi2ZbBtxrQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Oct 2012 19:16:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 4:25 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> I've got a tree which adds GStreamer 1.0 support, but have held off on
>> submitting it while Yocto's in release freeze.
>
>
> Maybe you could share?  I'd like to try it out soon and don't mind working
> with not-yet-pushed-to-oe-core pieces

also i think we need to make sure that we can install 0.10 and 1.0
simultaneously, to facilitate the transition (as it's done in most
distros), especially since gst supports that...

unfortunately, the provision for that isn't really there, since the
gstreamer recipes don't have the 'x.y' in the name. was that discussed
anywhere? could we ensure that gst1.0 comes as
'gstreamer1.0_1.0.0.bb'?

