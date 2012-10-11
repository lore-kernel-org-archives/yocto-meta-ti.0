Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E287E0142C
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:00:53 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so1993378vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ls8coR4x0EbGrrBv78zcXtwsxBIh9e3y/RdlggkHmYI=;
	b=nGyMdiCwfTTUzG2eTnFc9KwihfJHTxi3FKlOeAw+WXvqtsVKka4WywiSHqiltsTjor
	hfKH/w14Zp5nWD+dXjty7PPNtA1e7J0W0P3XWUUuhefkILjSQVis4lmvH5pvf54G/TH1
	+YbVN4QJiel5qiBOn4kqsYiOebdfG61vWfMbDNXTRo8fwXRfnUta7Q3phxVgoYwxOuiC
	lLaZ+s7hq6N0oayLktVAlYOL0fCr2VsfbwyHgObOko4JA2AcViANxcgKPQ06fkDOi4pt
	nsx2QmW4nJrIL3Q02aBoA3CT/ZlKVDM8prfspJqwAHQ9UX3DonnMSSy7qPVc1SifTSDj
	j04g==
Received: by 10.58.0.7 with SMTP id 7mr457043vea.18.1349960453347; Thu, 11 Oct
	2012 06:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 06:00:33 -0700 (PDT)
In-Reply-To: <CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 15:00:33 +0200
Message-ID: <CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
To: Enrico <ebutera@users.berlios.de>
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
X-List-Received-Date: Thu, 11 Oct 2012 13:00:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 2:46 PM, Enrico <ebutera@users.berlios.de> wrote:
> I think it depends more on what is the plan with that "forks": if they
> are being submitted upstream and the patch list will get smaller over
> time than i agree with you.
> But last time i played with gst-ducati was about one year ago and
> those "forks" are still there....
>
> If i have time i will try to investigate more on this and generate a
> diff to have real numbers (if somebody else doesn't already know
> that).

well, we maintain these trees in the team... these patches won't go
away until we move to gst1.0. with gst1.0, gst-ducati will run with
vanilla gst release

