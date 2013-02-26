Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id C58E1E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:48:20 -0800 (PST)
Received: by mail-ie0-f180.google.com with SMTP id bn7so4166141ieb.11
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=p+nwgZ81XwAYLIXIQdqN7qCjmiPq1ZANdEYthEbseNg=;
	b=gyWsXvPKs/Qn7YSk7NBUOvcm+B9thpjr9Ra7jrrjHKpB+XEeTzfo3yFw04BKrXfsBk
	+yngqUR6UsH+Vqo2ZKZA4a8mDqHArb0rC3EPSlbD3Rck2A+3ZfSJ11vgdzO2cUS0aW0+
	3Z82jxUvB0Zx0vd+mpDF/t1McWlsdt8iBLohXIhw2qiQRQwq6E+klauoiLFZIVgfwAaU
	NEPyRkj1/XOSZ7rbAgapQwn+CdI8ZYrmzNoU7r7ELAGrJWMSHxC26K/vI0Ks6HaxF0Go
	bKP+xrfRpHLkJ/1VowpPhnLNR5ASx6MDTz6Pj0IVxpaL9+xA7f3Dllmdne7dj8ue6G5a
	MZTQ==
X-Received: by 10.50.17.131 with SMTP id o3mr4917826igd.112.1361861300103;
	Mon, 25 Feb 2013 22:48:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 25 Feb 2013 22:47:50 -0800 (PST)
In-Reply-To: <20130226062413.GG6725@denix.org>
References: <1361852468-4352-1-git-send-email-denis@denix.org>
	<CAMKF1sq7h-bhjbCcaPdGHB8MxtZ0dE2LL_rWe2FDB3Uxmc7DNg@mail.gmail.com>
	<20130226062413.GG6725@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2013 22:47:50 -0800
Message-ID: <CAMKF1sorSZg7iP=PVt-hXJyikZoYyyEay9EK61yh4i=B6+RSJA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: add latest mainline release 2013.01.01
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
X-List-Received-Date: Tue, 26 Feb 2013 06:48:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 25, 2013 at 10:24 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Mon, Feb 25, 2013 at 10:07:25PM -0800, Khem Raj wrote:
>> On Mon, Feb 25, 2013 at 8:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > +PR = "r1"
>>
>> not as important but better to get rid of it.
>
> Better? There's no harm in it and it prevents you from forgetting to update it
> later. Otherwise it's just a matter or personal preference.
>

better in an initial recipe I meant. later updates could change it.
with PR services its not as important as it used to be.

> --
> Denys

