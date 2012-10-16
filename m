Return-Path: <tom.rini@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92E55E0027E
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 18:20:50 -0700 (PDT)
Received: by mail-la0-f48.google.com with SMTP id u2so4248037lag.35
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8aM1oxL9E6uDy6GSY0mcaxfIKrNDtAkbJnuBElb8AEk=;
	b=IyxR70uf1HgeGCy4S8ABJJwMTtWS6k8tufQEafiFX0wj9B6BYj0Bk9nB6sKJBRL1K2
	pnUCqScuuS81AZAtmZtubM7/0lm1rfDp0Jtnk4R1FXVF958ykEMhyJG9uU4Bzc9cdJE3
	v6CcRS4GattjX/wLp98MEc++BbS8dOjmAURruhVjqaGZKMzc4vAOACxvlxiRsdcHTB7P
	ZZ9fHGqw9VKvbT2I1euyfVWSu6xp1rJjqcSsgv6jQrygrxKYbeFlIGTXhHkeC9cMaN0y
	EY12Q1DCzHNWbzbMlopCpxr7z8J5IYo9AeYocZbRrSoe55z6cqNyDcyPxzb36YPhZKoO
	NJAg==
MIME-Version: 1.0
Received: by 10.152.108.42 with SMTP id hh10mr11288656lab.4.1350350435070;
	Mon, 15 Oct 2012 18:20:35 -0700 (PDT)
Received: by 10.152.13.70 with HTTP; Mon, 15 Oct 2012 18:20:34 -0700 (PDT)
In-Reply-To: <507C1073.3060703@communistcode.co.uk>
References: <507C1073.3060703@communistcode.co.uk>
Date: Mon, 15 Oct 2012 18:20:34 -0700
Message-ID: <CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: ml@communistcode.co.uk
Cc: meta-ti@yoctoproject.org
Subject: Re: u-boot compile failure
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
X-List-Received-Date: Tue, 16 Oct 2012 01:20:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 15, 2012 at 6:32 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> It seems that u-boot is attempting to use GCC includes from my host system
> here. This surely isn't right is it?

There are host tools to build.  That said, from the log it looks like
you have been trying to build this a few times.  If you bitbake -c
clean u-boot do you still see the problem?

-- 
Tom

