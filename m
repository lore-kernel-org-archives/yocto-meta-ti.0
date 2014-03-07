Return-Path: <raj.khem@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CD7CE00B24
	for <meta-ti@yoctoproject.org>; Fri,  7 Mar 2014 13:03:55 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id ec20so3230725lab.29
	for <meta-ti@yoctoproject.org>; Fri, 07 Mar 2014 13:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qfHe6p9pJNkwPPw/qwV1pyBsrlieK6nmcJgLSuXPShs=;
	b=MzzX4Lk8COLHgJnm728LPjZK99WnF0m5u/+uO5ZCzWAKqNEhGs5NnN7qbbZPpTnW+l
	DKKTrT7uiFwWYHWBB2oYINsJfh6EnrQ9an+8AnB5sad9G0aGpNKsn4ll4Ws80GgNxGEc
	mYxqaTos/moIbErAsrICSSVMi+Ak2KnaTIsS98XqGFTI4JZPFweDgfloAWhZMUfsoXlm
	27jgXpla87Ipv3/onxbyygJmFl/IZTX7o23V/Se6W03uIM3Rca4bYqHY0viV/T62JkHC
	yxt2gNtvAznQQXsjaj5DtSkcNElyD2DJz+IfH3SL7xUjvmoQxOonytEu/vnVvr8ZE6H/
	mBiw==
X-Received: by 10.112.128.170 with SMTP id np10mr12580329lbb.22.1394226233662; 
	Fri, 07 Mar 2014 13:03:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.185.231 with HTTP; Fri, 7 Mar 2014 13:03:23 -0800 (PST)
In-Reply-To: <1394215241-14051-1-git-send-email-denis@denix.org>
References: <1394215241-14051-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2014 13:03:23 -0800
Message-ID: <CAMKF1sqiidoFYkyVyFBjcQ=qy2TKfgHaLL2b46TykWkyhf0wFA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-mainline: add 3.14 mainline recipe
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
X-List-Received-Date: Fri, 07 Mar 2014 21:03:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 7, 2014 at 10:00 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}"


is it possible to get rid of MACHINE_KERNEL_PR

