Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94958E011AF
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 12:36:50 -0800 (PST)
Received: by mail-vb0-f41.google.com with SMTP id v13so1953290vbk.28
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 12:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N+sBW/FO3fJEV/xS1GunPjh0vPNKmk5bx9u0IbSRUDA=;
	b=nhXKWcqnnI0aQinb8gg46VT8lHbY8z27Kwi47ZpfuCzvYiN5/y9cIoMftybw9LoHXo
	+oNL6JBAmyJLzv7omDbFrL2wBgdyiawZCqQTBZC0DDVC7t+6ZvfnG8E1OzyxAHZpkWdN
	LOn2Kd0O4FYee0Okp1ElrncbjoHRT+bzy/DspX5MqUuGULRdEkVqnNbMYebOxtHrgqJX
	SYbA7N7WYKLUiLzWyEdNSGI3H1h9hz+MCnubiki/4Tdy9h/dYZUOhUkwRNJOS7bxDlqX
	NVBCzEYYB3SK43BSA13bmBhKt/g2LA4Ie1WSCkshBHGls6AU4HW8Q29xsWx8WxyQlh3A
	61Lw==
Received: by 10.221.11.203 with SMTP id pf11mr3039183vcb.70.1353011809516;
	Thu, 15 Nov 2012 12:36:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Thu, 15 Nov 2012 12:36:29 -0800 (PST)
In-Reply-To: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
References: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 15 Nov 2012 21:36:29 +0100
Message-ID: <CAOT3miJQ_VscLkeWfdVXY-kMrn4AL=4wyV3yKyrm9wH0aDVFrw@mail.gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard fails to fetch 3.4 kernel
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
X-List-Received-Date: Thu, 15 Nov 2012 20:36:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 15, 2012 at 9:32 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
> ERROR: Function failed: Fetcher failure for URL:
> 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/open-nandra/yocto/poky-danny-8.0/panda_build/tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.4-r0/temp/log.do_fetch.19671
> ERROR: Task 681
> (/home/open-nandra/yocto/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb,
> do_fetch) failed with exit code '1'
>

are you behind a corporate firewall?

is it reproducible several times? it could be a weakness of our git server...

