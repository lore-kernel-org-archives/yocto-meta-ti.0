Return-Path: <errordeveloper@gmail.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88785E0140A
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 14:16:48 -0700 (PDT)
Received: by mail-vb0-f42.google.com with SMTP id p12so3016693vbe.29
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 14:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=t+UdO0tRga8C51mO99/GepoV/fEQKFuCLIeVFykYKqM=;
	b=FubefjNBOQBNnGUT6ficroenV9di/Movbks0WNE/ttSzBuFLTH3V39qRkdHlRb/T0I
	D5P9oUroXwdUbEAB/iWFns1EcO8AKkV6nfYgk43jWoUp0z0jsAeUqn/V+yn909622bgj
	2KGBVVoAVIcXs9oxbt5yrfxeawAvfh3E+p382Be8xtrrk5ZVnhWvCIaqo6//S1xtfCfI
	5P64X57DKXn9DcmIcHzSsHy0FEgDoEfON+CRfLxHOGUNsYB0PIogfRyyAvO4VyA7z7AP
	5/i/ssStWOOgWVVa79mAxkGQbG67R0GQJUBHlXbl1bQ7qIhU4MvzUnoE84gqmO8aLaF6
	ZGeg==
MIME-Version: 1.0
X-Received: by 10.220.245.4 with SMTP id ls4mr9560052vcb.17.1366319807748;
	Thu, 18 Apr 2013 14:16:47 -0700 (PDT)
Received: by 10.59.7.197 with HTTP; Thu, 18 Apr 2013 14:16:47 -0700 (PDT)
In-Reply-To: <20130418201125.GT1518@edge>
References: <CAPhDKbH84Nhitv+DW6Vcaza0VCjx=T_nw+KUcreico0vBsLAwA@mail.gmail.com>
	<20130418201125.GT1518@edge>
Date: Thu, 18 Apr 2013 22:16:47 +0100
Message-ID: <CAPhDKbG1A0VdDv5CkApiS_2Bp+4NrTiNV4MZqcE=GNZVZhqAZA@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>, meta-ti@yoctoproject.org
Subject: Re: Connection refused to git.ti.com
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
X-List-Received-Date: Thu, 18 Apr 2013 21:16:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 April 2013 21:11, Denys Dmytriyenko <denys@ti.com> wrote:
>
> That's quite strange that you can clone from one machine and always get
> connection refused from another.

Yeah, seems like a firewall issue of some kind.
I forgot to mention explicitly that the two machines are on different
networks with different public IP addresses.

Do you have anyway of checking this the server admin?
I can provide my IP address if needed.

> You can share the cloned repositories betweenn machines by copying
> $DL_DIR/git2/git.ti.com.*

Yes, that's exactly what I ended-up doing.

