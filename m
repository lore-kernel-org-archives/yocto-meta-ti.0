Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B62CDE00307
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2011 10:51:39 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qadb14 with SMTP id b14so3607136qad.35
	for <meta-ti@yoctoproject.org>; Fri, 04 Nov 2011 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pa5mAmnk0iM7A16z5dff/b2X9E2MYDwXdQX9kDzxhjg=;
	b=GilBvDnWjlICaQvc7WbHW+BkQcXIvyFZRuJMiudggeqxhFXp8KjTd4WHQPJomSo8Ie
	dMg9fdbW03kpnzgkU6Py0qUfblFvw9LwymkoWD/Vu7n3lH8IJbPd4lAiKiai3fUMtxwz
	nEDPUJIYQjgufg1/a1KadA/Z++WXeUjV8wDK0=
MIME-Version: 1.0
Received: by 10.229.177.40 with SMTP id bg40mr2036499qcb.152.1320429098868;
	Fri, 04 Nov 2011 10:51:38 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Fri, 4 Nov 2011 10:51:38 -0700 (PDT)
In-Reply-To: <CC88246E-01E5-4BA1-A555-68F557393200@dominion.thruhere.net>
References: <1320377869-29758-1-git-send-email-joelagnel@ti.com>
	<CC88246E-01E5-4BA1-A555-68F557393200@dominion.thruhere.net>
Date: Fri, 4 Nov 2011 10:51:38 -0700
Message-ID: <CA+M6bXkub505qK5YKWd28mCc0uB974gPmVLw35m6dhNsefnPwg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org, Joel A Fernandes <joelagnel@ti.com>
Subject: Re: [PATCH] u-boot 2011.10rc: Fix pmic shut down over USB power
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2011 17:51:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 4, 2011 at 12:44 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 4 nov. 2011, om 04:37 heeft Joel A Fernandes het volgende geschreven:
>
>> These are some fixes suggested by Jason Kridner to fix the PMIC
>> instabilities we've been seeing over USB power.
>>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> Cc: Jason Kridner <jdk@ti.com>
>
> Applied, thanks!

This is of course the bad for A1 patch :)

-- 
Tom

