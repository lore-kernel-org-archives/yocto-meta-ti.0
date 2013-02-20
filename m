Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id B1AB8E006CC
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2013 05:15:38 -0800 (PST)
Received: by mail-vb0-f41.google.com with SMTP id l22so5036288vbn.28
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2013 05:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=SUdPvDqhiOY6J/VASNXfWjr6rOA61KUYoce130I4cJw=;
	b=GRopSwDVzjZ0IZJO9DCmSUFUG5NSf8QaItOWvnDbcvtunI7ZwGteGaoA4p0KkiE5oL
	EpRy3Wi3AFChtIJ3CZMxUJ8UMnfmYQqcezs9KGgNhMOM5sVA7prZJJRr4uobIrAAHp6j
	bl3DAeG2KPyA/m4pqGwble0QQovefwooO0c3LbbNFkXnJzOVdEPToZMPafWWsGXxx6cq
	eIybfDTcAhXvR43/6fItriFJVYXHflSwmsQ+eBpSmmO1L0izdrBpfaHa7mAkamelN5n7
	XYl2P2fr04g1FOH4h1GbgwXCjQ7H8x/Rw2LzkxtyVC7RKBU8h3GWJIgaDTuYEhzniVni
	POZw==
MIME-Version: 1.0
X-Received: by 10.52.88.237 with SMTP id bj13mr22478390vdb.75.1361366137647;
	Wed, 20 Feb 2013 05:15:37 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Wed, 20 Feb 2013 05:15:37 -0800 (PST)
Date: Wed, 20 Feb 2013 14:15:37 +0100
Message-ID: <CALbNGRRkxbzvQa0Lieiknz=QS+LehASn+6-QD2qY5G-CkND7zQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Subject: arago servers sane?
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
X-List-Received-Date: Wed, 20 Feb 2013 13:15:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi

after deleting all my temp file I get during parse (?!):

ERROR: ExpansionError during parsing
/home/andreas/data/oe-core/sources/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
Failure expanding variable SRCPV,expression was
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
Fetcher failure: Fetch command failed with exit code 128, output:
fatal: The remote end hung up unexpectedly

ERROR: Command execution failed: Exited with 1

I tried to browse http://arago-project.org/git/projects/ but get only
an empty frame and the page loads forever.

Any thoughts?

Andreas

