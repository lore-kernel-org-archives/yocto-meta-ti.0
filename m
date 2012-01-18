Return-Path: <raj.khem@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B516E00307
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2012 10:49:47 -0800 (PST)
Received: by lahl5 with SMTP id l5so2335260lah.35
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2012 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EbBt2w76JBVGnliKvr4HSJ2LMLJPy2BRd60YjwjdW9c=;
	b=o+kCBj14AK5oF2m4Wx9hKmQ+boqt+qS76evd2jpITYsZ6ddgVagEa0X69j6oC6b51N
	S+H0rdJiLXjSizzt2gRhXGJIbXRtg41LPm7rV+kPX7R794c7e/ODfLWDkD9VSupCCIAZ
	u8bcomwwTDkWYmsCQ53jmcsfwvrqxRnYl9UaU=
Received: by 10.112.101.34 with SMTP id fd2mr5520308lbb.16.1326912586283; Wed,
	18 Jan 2012 10:49:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Wed, 18 Jan 2012 10:49:15 -0800 (PST)
In-Reply-To: <20120118174340.GE17838@denix.org>
References: <1326907639-31710-1-git-send-email-raj.khem@gmail.com>
	<20120118174340.GE17838@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jan 2012 10:49:15 -0800
Message-ID: <CAMKF1soF5BPGw0FLOg5MTSG4DwL17n-92Dc8K6PhoJAnfk6iKA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-3.0: Fix perf compile failure with eglibc 2.15
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
X-List-Received-Date: Wed, 18 Jan 2012 18:49:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 18, 2012 at 9:43 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>
> Khem,
>
> Do we need 2 copies of the patch - one in linux-3.0 and one in linux-3.0/misc?
> I see the first copy is not being used...


ah the one in linux-3.0 is spurious
>
> Also, does it need to be submitted upstream? Should there be an
> Upstream-Status field?
>
yes I will add that although its a git-am able patch so if I add
that field you have to edit that if this patch is to sent upstream
with other pull requests

