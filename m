Return-Path: <raj.khem@gmail.com>
Received: from mail-ia0-f176.google.com (mail-ia0-f176.google.com
	[209.85.210.176]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id B6648E002AB
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:07:55 -0800 (PST)
Received: by mail-ia0-f176.google.com with SMTP id i18so3132833iac.35
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=PmDs135VPFgGXsXmlkuzXEJ+NF4mNXn21/QdUW4Esw8=;
	b=w3WPUoPXLP6NllSPvZM9Nmdue4rucue2sUCJpDDJM6XTt4KA7FRWwLZECZUZAP1uTQ
	X9Mc2KPrQBwaxrUCcRKnbUF/c+0jLLgfmZmG6BBa4W3ff2nxSMYYpLHyCCkNjmsCJ0m0
	XY8q3rNEJMslHoNiMSmGN476u1LrrE0hCrDwp7eTU21TKO0hYorePvtf/KAhsLpeoPqa
	YRvX6+dFtwUfeZvpinfIn0kChNjefvC4yRn+H9P3MXfUzXiFx5F5ttVg3Zz8MeN+KcLd
	5WD4WpcivuOwUZjjA36i4OJB+0vHcDWvuXQlXuwO/aQvYeLMUfKIvE6PrFcHMfLgenQ6
	EMBw==
X-Received: by 10.50.56.141 with SMTP id a13mr5018388igq.24.1361858875154;
	Mon, 25 Feb 2013 22:07:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 25 Feb 2013 22:07:25 -0800 (PST)
In-Reply-To: <1361852468-4352-1-git-send-email-denis@denix.org>
References: <1361852468-4352-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2013 22:07:25 -0800
Message-ID: <CAMKF1sq7h-bhjbCcaPdGHB8MxtZ0dE2LL_rWe2FDB3Uxmc7DNg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Tue, 26 Feb 2013 06:07:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 25, 2013 at 8:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> +PR = "r1"

not as important but better to get rid of it.

