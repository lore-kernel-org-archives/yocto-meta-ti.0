Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2218E0142C
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 05:46:20 -0700 (PDT)
Received: by mail-bk0-f48.google.com with SMTP id ik5so898590bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 05:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=behNwhQfdWGEAiKfMgcx1Z5cwrbTz587nx/F6+r8vgI=;
	b=YSwp8Yn3Vl3MfM3MxE88kxMwSxVkRyd6bqJsXOOBsAvOB4PPgn0JFHJNMUl1fpYVry
	IbyFZzflCxQPm94aEWu7dV+RnWD5BQNVAIKcf4sGpqE6HKjcZV8lvEEd/kO+BuFHCWfY
	nAztEWrmT/f6XdgwHdJD+RKlkz3uIH4v+/4pMngVgEBrK6ZiD6hZA2vHVEVa26ElNzrE
	2REHuEhiye9W6cka9tbkCjdkdUINJI9xlxRjix7xwewxl7oG7gHcR/Nex9U5Ol3/2ISQ
	9yclvsRh/FgxJeW7B4y6VrancHb7Ypy+kVHk0n3N0rAD+D+pvbTDizwRp8ktXlmNEM0W
	Rgew==
MIME-Version: 1.0
Received: by 10.204.9.9 with SMTP id j9mr300227bkj.12.1349959577565; Thu, 11
	Oct 2012 05:46:17 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.204.145.71 with HTTP; Thu, 11 Oct 2012 05:46:17 -0700 (PDT)
In-Reply-To: <CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
Date: Thu, 11 Oct 2012 14:46:17 +0200
X-Google-Sender-Auth: CIH91HSfdPwQ9ta2l9BZlA0CUoc
Message-ID: <CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Oct 2012 12:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 2:18 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Thu, Oct 11, 2012 at 12:59 PM, Enrico <ebutera@users.berlios.de> wrote:
>>> i would expect that it might be cleaner to archive the patch series,
>>> than changing the SCR_URI... that's just my guess.
>>
>> Last time i tried this i noticed that the patch list was huge so it
>> was easier to just use that tree. I don't know what's the status now
>> but from a quick view it seems the same now.
>
> it is certainly easier... now if the goal is to have that patch merged
> in meta-ti, the easier might not be the right one...
>
> i will let meta-ti maintainers chime in.

I think it depends more on what is the plan with that "forks": if they
are being submitted upstream and the patch list will get smaller over
time than i agree with you.
But last time i played with gst-ducati was about one year ago and
those "forks" are still there....

If i have time i will try to investigate more on this and generate a
diff to have real numbers (if somebody else doesn't already know
that).

Enrico

