Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE641E0144D
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:47:36 -0700 (PDT)
Received: by mail-bk0-f48.google.com with SMTP id ik5so939155bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Fiw0sg79yRZLCsGjso+P7vJ/kJsmbmDHq9k8n/gfr28=;
	b=Yp1PKLtvCuZ5m6FH4ZyhNUJXHHAO+h7HGQ6AHBJ0Aa8u6SF1/obPKeMAnXCzqwCKNA
	aJs/PupbN/E4ux9iJBj0afe7VMDaicl403LniqE35aMbhscK1gOfZ8zBYc50bYb4XlJZ
	D/HGDi81IOqITbrMqxf7J6IeUiqqey/fH2W0MeBeMDslgsKeb9dhm43bKuhDjt2JsNmd
	s2NZXBRKL3ppa8npNcgV87v/pxknCaHjicvVbGs7MA6dLTqTMa5B/EsMUBak1iC80hT1
	Nb/lN5B/kwNGsyvETqJnspfgg06T+iyzNtyoioEYnDXl5eWst3yrZrcfuPQbfmZSgBfW
	uWBg==
MIME-Version: 1.0
Received: by 10.204.148.146 with SMTP id p18mr366979bkv.51.1349963255644; Thu,
	11 Oct 2012 06:47:35 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.204.145.71 with HTTP; Thu, 11 Oct 2012 06:47:35 -0700 (PDT)
In-Reply-To: <CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
Date: Thu, 11 Oct 2012 15:47:35 +0200
X-Google-Sender-Auth: dRzL2573q7-xlMnMM9JF4YINagA
Message-ID: <CA+2YH7se1CDUB4WnRB9kXa31-WAi2iUgXaxsDHuwCPugXw_AHA@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Oct 2012 13:47:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 3:00 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Thu, Oct 11, 2012 at 2:46 PM, Enrico <ebutera@users.berlios.de> wrote:
>> I think it depends more on what is the plan with that "forks": if they
>> are being submitted upstream and the patch list will get smaller over
>> time than i agree with you.
>> But last time i played with gst-ducati was about one year ago and
>> those "forks" are still there....
>>
>> If i have time i will try to investigate more on this and generate a
>> diff to have real numbers (if somebody else doesn't already know
>> that).
>
> well, we maintain these trees in the team... these patches won't go
> away until we move to gst1.0. with gst1.0, gst-ducati will run with
> vanilla gst release

That's great, apart from the firmware blob it's now easier than omap3
gstreamer-ti.

Let's hear from meta-ti maintainers then.

Enrico

