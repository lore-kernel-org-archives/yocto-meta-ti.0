Return-Path: <jon.szymaniak@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAA00E01308
	for <meta-ti@yoctoproject.org>; Sun, 28 Apr 2013 19:10:14 -0700 (PDT)
Received: by mail-wi0-f180.google.com with SMTP id h11so2278664wiv.7
	for <meta-ti@yoctoproject.org>; Sun, 28 Apr 2013 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=CL3iZ4E3AFemsqXFt53aoqjH5+xJmQ3f82TP4Q5X1Dg=;
	b=ccB2l20mUgzyz0Ab2K4yn3a9Xwn7y6zK3hLRgRoulf6oQagylgPFVbrBDsAfGXt62G
	0C2egQMSAPJNxJh2fK+8tgCaP6+iG0iACzgAlhqThCtLUS4yd4i+GSA5k60jGcwhJxhz
	0dlqsAkdf4BURjxnPqth5a8rgmzxTIEcc9Jayv9DvrT0tEqcJWnZH0qjPSMKw1KPsI78
	d6BPgBd4QLeCbxqHdioOBR3eVL3EpVZQXHE+gC5TL2UBPRltBaxM/uHoGUn+4/l0Zpzn
	wiESyuKOqaGQLFFEQJMS2NF4FMDXMro5YiI+hA6BoLm19pSCONpDgVBuFujEWFz8tUSl
	WrXg==
X-Received: by 10.194.59.208 with SMTP id b16mr10140551wjr.15.1367201413402;
	Sun, 28 Apr 2013 19:10:13 -0700 (PDT)
MIME-Version: 1.0
Sender: jon.szymaniak@gmail.com
Received: by 10.194.37.233 with HTTP; Sun, 28 Apr 2013 19:09:53 -0700 (PDT)
In-Reply-To: <20130428201051.GB11072@edge>
References: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
	<20130428201051.GB11072@edge>
From: Jon Szymaniak <jon.szymaniak+gpg@gmail.com>
Date: Sun, 28 Apr 2013 22:09:53 -0400
X-Google-Sender-Auth: xc5qB5lgs9oKrxzu-6pWyaAN-VA
Message-ID: <CANge7vXrkgrcOyn8Sn2wC5qXLOw2FwzVqW9QfOjs-tBLuirkxw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, sallen@ti.com
Subject: Re: linux-ti-staging fetcher failures
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
X-List-Received-Date: Mon, 29 Apr 2013 02:10:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Apr 28, 2013 at 4:10 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Sun, Apr 28, 2013 at 01:50:55PM -0400, Jon Szymaniak wrote:
>> Hi all,
>>
>> I just wanted to inquire about the status of git.ti.com, which the
>> linux-ti-staging_3.8.bb recipe clones from.
>>
>> I've been trying to bring up my am335xevm, and have been constantly getting
>> timeouts from git.ti.com for the last few days.  I've had no luck manually
>> cloning the kernel from this server -- is this not publicly accessible?
>
> Jon,
>
> Thanks for your inquiry! Unfortunately, I also noticed that git.ti.com was not
> accessible from outside since at least Friday. I will let our admins know, so
> they can take a look at the problem. Sorry for the inconvenience.
>
> --
> Denys

Thank you Denys!

FWIW, a friend of mine who's a couple miles away and on the same ISP
is able to clone the kernel and visit the git web front-end.  Nothing
jumped out at me when comparing our traceroute/tracepath results --
everything's largely the same. I also see that ICMP seems blocked for
me, but not for him.

Strange...let me know if I can provide any useful info.

- Jon

