Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54C86E0142C
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 05:19:14 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so1941245vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=h8tsSTxsavf/73cjzYByg4rHTahrUz08SBW9iwFbdfg=;
	b=o0B9KFQR3f+9xha7N5e2pCVajMGiLWbUjPfqmjCBysfX84/DfHYsfiKpg8S5fLSCEn
	JsKQp04vKQgg6EuYOIPwNRUX9w/IGEvVkca68q3x7kT0XlAVS2liCytxts/3VDPJMdZI
	t+zwjb2teyEifPCTJnmstSn71HSNwaluTm1trYB2MFXtyt/qqk8Z0vQJnUjfrYG00pWO
	CVoYaZuNlEykhLGkzKGIZapL1vrx3HUnxLhNgnopX6uDaHEAofBixupc0bHNhX4sy91q
	DTHwiMG1P33YjlmgUhCY6/X3H4QktIeNAfgWIe9fMRR+vjRZQeHlyi6NfxCT6Vp7ZLzb
	TJAw==
Received: by 10.58.0.7 with SMTP id 7mr396129vea.18.1349957953867; Thu, 11 Oct
	2012 05:19:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 05:18:53 -0700 (PDT)
In-Reply-To: <CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 14:18:53 +0200
Message-ID: <CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Oct 2012 12:19:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 12:59 PM, Enrico <ebutera@users.berlios.de> wrote:
>> i would expect that it might be cleaner to archive the patch series,
>> than changing the SCR_URI... that's just my guess.
>
> Last time i tried this i noticed that the patch list was huge so it
> was easier to just use that tree. I don't know what's the status now
> but from a quick view it seems the same now.

it is certainly easier... now if the goal is to have that patch merged
in meta-ti, the easier might not be the right one...

i will let meta-ti maintainers chime in.

