Return-Path: <jfabernathy@gmail.com>
Received: from mail-vw0-f48.google.com (mail-vw0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4391E0044C
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 14:32:56 -0800 (PST)
Received: by vbjk17 with SMTP id k17so5494528vbj.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 14:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jfabernathy@gmail.com designates
	10.52.88.103 as permitted sender) client-ip=10.52.88.103; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jfabernathy@gmail.com
	designates 10.52.88.103 as permitted sender)
	smtp.mail=jfabernathy@gmail.com;
	dkim=pass header.i=jfabernathy@gmail.com
Received: from mr.google.com ([10.52.88.103])
	by 10.52.88.103 with SMTP id bf7mr38981345vdb.72.1330986776000
	(num_hops = 1); Mon, 05 Mar 2012 14:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=y+zM+ORqjTYkl6ITPrBtBbZPc3EvUMXMO94k5tpsVjs=;
	b=BoBLbq251Gv7JaACpTAooAixfo0mGUk9rx8/uRzFX6ecUv5PsNRRjgG542tJo8KNIq
	PyzLcwurQwlqQFi/lUiJ4kSxx01KptzBEY3XtYWfFQJU4/iE1pfpk6SVlGUGW/cKXyF7
	cxh0XDEf11Pg7PI7osWLZJVFIAMvNQvHmfKnOuG0BQv3eGZhmkKrGezcmetL8U/5ef+w
	EQ07VY20gEYLM6fSMNZdByhFpsainlMYzgeNcEpaZJ9354fPi4GoEQHOYZx5iWcKnmB/
	829t8t3Ch3e9u3KLdTyu4fi61mCD/kGKC8PcAexoOfjA2WUkYTJ0b9EMveKn+Z9mleQb
	zuDw==
Received: by 10.52.88.103 with SMTP id bf7mr33352705vdb.72.1330986775801;
	Mon, 05 Mar 2012 14:32:55 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-49-18.dhcp.embarqhsd.net. [184.3.49.18])
	by mx.google.com with ESMTPS id
	d7sm27240813vdu.15.2012.03.05.14.32.55 (version=SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 14:32:55 -0800 (PST)
Message-ID: <4F553F17.8000602@gmail.com>
Date: Mon, 05 Mar 2012 17:32:55 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: building for OE pandaboard with angstrom
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
X-List-Received-Date: Mon, 05 Mar 2012 22:32:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Since the README says that to get the complete features of the 
pandaboard you need to follow the instructions at the angstrom link 
provided, I tried that.  The console-image builds and boots, but the 
systemd-gnome-image fails on a do_fetch.  Error message is below:

| ERROR: Function failed: Fetcher failure for URL: 
'ftp://ftp.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20111211.tar.gz'. 
Checksum mismatch!
| File: 
'/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz' 
has md5 checksum 1047c5bb332e96cac982b2eaf76e84f7 when 
f99a90a91b23338b4df765c0d18eba73 was expected
| File: 
'/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz' 
has sha256 checksum 
73b8d9f14bd08da79cb2bbb6e8ec3c4de23f2213a2c25fbe07b720dbfc852d73 when 
6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7 was 
expected
NOTE: package ca-certificates-20111211-r0: task do_fetch: Failed
ERROR: Task 3064 
(/home/jim/poky/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb, 
do_fetch) failed with exit code '1'


