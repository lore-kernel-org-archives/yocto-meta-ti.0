Return-Path: <javier@dowhile0.org>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	(using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 7D4A5E00496
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 01:27:00 -0800 (PST)
Received: by mail-wg0-f54.google.com with SMTP id fm10so2174182wgb.21
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 01:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=VmEbNxjk9+ajTHMrIvt0zaPLQUrgyTGeZFTPKuF2P1M=;
	b=UBOmLgeQisQHvbN6RoXc5WCkl7Ir/gYNnosb4tBpNL6TOXkq7ewbJD48sJ30W8JwoL
	g7vJy7JddfujbIFAO+zZ6Bb/yxXAkCfMicueURhSeVV1SR+AAhgW9I5dG5LVCWeAzvDS
	J5f1ooi66mDZTv21KbwVXB8JYmjc+4QnElIuNrTUq1uTQK0qO08SebLVh9tz+Q2SNkTD
	r5RX2PNXZ0N7YxD7f3sIYIedCgCyNKmZNC3hPd+73fBrXOrVHAWG1fXLtMVZhv3JasYk
	GzhnQ8b2NG67utEi+PlD5SaaiURMobO2ZMU65FVIA7m9KIqax6R5D8YHkDWdi/qwYR7t
	dxzA==
MIME-Version: 1.0
X-Received: by 10.194.109.35 with SMTP id hp3mr3575597wjb.15.1361784418052;
	Mon, 25 Feb 2013 01:26:58 -0800 (PST)
Received: by 10.180.124.106 with HTTP; Mon, 25 Feb 2013 01:26:57 -0800 (PST)
X-Originating-IP: [188.77.214.59]
In-Reply-To: <20130220185430.GE13500@edge>
References: <CALbNGRRkxbzvQa0Lieiknz=QS+LehASn+6-QD2qY5G-CkND7zQ@mail.gmail.com>
	<20130220185430.GE13500@edge>
Date: Mon, 25 Feb 2013 10:26:57 +0100
Message-ID: <CABxcv=nM3YOvsgdTZ57mfq6NRD0DP=j2izXtYqJmFT4wBk5jAw@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Denys Dmytriyenko <denys@ti.com>
X-Gm-Message-State: ALoCoQnOQBOpiOrMTF1hkq7qj4o5PCe2yHU/rs+mHEwyxCgGpOKoA+dt4cRJJAazZhsF7mTtXC1H
Cc: meta-ti@yoctoproject.org
Subject: Re: arago servers sane?
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
X-List-Received-Date: Mon, 25 Feb 2013 09:27:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 20, 2013 at 7:54 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Yeah, as soon as I go on travel, things start falling apart... :)
>
> For some reason git service went down, should be working now.
>
> --
> Denys
>
>

It seems the git server is down again. I'm having this error when
trying to build an image:

$ bitbake core-image-minimal
Loading cache: 100% |##############################################|
ETA:  00:00:00
Loaded 74 entries from dependency cache.
ERROR: ExpansionError during parsing
/home/javier/collabora/devel/yocto/meta-ti/recipes-bsp/boot-monitor/boot-monitor_git.bb:
Failure expanding variable SRCPV, expression was
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
Fetcher failure: Fetch command failed with exit code 128, output:
fatal: The remote end hung up unexpectedly

ERROR: Command execution failed: Exited with 1

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

It also fails if I try to manually clone the repo:

$ git clone git://arago-project.org/git/projects/boot-monitor.git
Cloning into 'boot-monitor'...
fatal: The remote end hung up unexpectedly

Best regards,
Javier

