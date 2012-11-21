Return-Path: <ross.burton@intel.com>
Received: from fmsmga101.fm.intel.com (mga05.intel.com [192.55.52.89])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBA52E0141C
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 15:07:41 -0800 (PST)
Received: from mail-ob0-f200.google.com ([209.85.214.200])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Nov 2012 15:07:41 -0800
Received: by mail-ob0-f200.google.com with SMTP id lz20so33692793obb.11
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 15:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=vktykzcWUxYxSTJnw+QqiR5RBJiVImZebd9Cyph72/A=;
	b=YnAJRrNozqwNXsmykNdKlrIASAHuYaaZlYzgCK3Fa313SJbp6CqHWBgd7ZYW6IiZLP
	C5LjqW/bJuiwd1lKrJvXZe/Z4MqfLdkBlApt3hsCxDOFaHPmbBB5xSToohHchpjeznQL
	QafNJsRxKTM9veXVJxD49T4C6COMyMoUye0C4oRa3too1oDZ9ZSMH2cIvllGY+vGoQ54
	x5mKJLMF8zMvKN8gZDtY/CGCQaUh0emGbFgQng/gmqWv5rYLjXfuVCMZfvQ3K4h/D2RC
	YzQogBLX8aRnPdH/pgw4YbJtwbwPQ2BT4ovkIMWUQdkM831eFB3/uaLaHLK3njn2OrTm
	+vsA==
Received: by 10.60.169.243 with SMTP id ah19mr17629149oec.127.1353539260386;
	Wed, 21 Nov 2012 15:07:40 -0800 (PST)
Received: by 10.60.169.243 with SMTP id ah19mr17629142oec.127.1353539260177;
	Wed, 21 Nov 2012 15:07:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.154.37 with HTTP; Wed, 21 Nov 2012 15:07:19 -0800 (PST)
In-Reply-To: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
References: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2012 23:07:19 +0000
Message-ID: <CAJTo0LYLf=296eEZznK7vnFTJZhAS_u1opuXdyJ=MUvRYF1Asw@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
X-Gm-Message-State: ALoCoQk817V6kWt+3SVU+m6sup3pKnyN7lqy5ANcYGdyc5ZHhLWkojiNDcHClRAU2+zSfLdLnsG/yJkrlNazAO34sNUgU1SzMebwwWYmHot8hJu3eu+HTLuy7hpUUFni1kyR6TldPO9lV4EwfCvDz5z7Fy8OP4vRZQ==
X-Mailman-Approved-At: Wed, 21 Nov 2012 15:32:46 -0800
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 23:07:41 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2012 22:52, Nicolas Dechesne <ndec13@gmail.com> wrote:
> since xf86-video-omap was recently merged in oe-core and poky, i am trying
> to remove the recipes we had staged in meta-ti trees for some weeks
> (http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=410dc026f2ee24a2346e7563a83f0181c79809cf).
> so i was trying to build  poky/master with meta-ti/master, for pandaboard,
> and I get build failures in xf86-video-omap [1] and [2].
>
> so [1] is actually trivial, as we are missing a DEPENDS in the recipe, i can
> send a patch in oe-core for that.

Please do.

> [2] is a bit more cryptic to me.. so I quickly tried to build with danny ( i
> just cherry picked the commit that introduced xf86-video-omap from master)
> and this time it built fine.
>
> has anyone actually tested this recipe? if so I must be doing something
> wrong, any hint would be helpful.

This was discussed a few hours ago.  It's caused by a) the
configure.ac being broken and b) the workaround for this being removed
by me in e828faf027540bc5def8b7371a959884caad9557 (which is in master
only).  Presumably this code was test built before that patch landed.

As this is a genuine upstream bug (ARM-specific driver that doesn't
cross-compile?!) I've just filed fdo #57386.

Ross

