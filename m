Return-Path: <jfabernathy@gmail.com>
Received: from mail-vw0-f48.google.com (mail-vw0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95E27E0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 16:48:51 -0800 (PST)
Received: by vbjk17 with SMTP id k17so5630304vbj.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 16:48:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jfabernathy@gmail.com designates
	10.52.77.101 as permitted sender) client-ip=10.52.77.101; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jfabernathy@gmail.com
	designates 10.52.77.101 as permitted sender)
	smtp.mail=jfabernathy@gmail.com;
	dkim=pass header.i=jfabernathy@gmail.com
Received: from mr.google.com ([10.52.77.101])
	by 10.52.77.101 with SMTP id r5mr39793867vdw.109.1330994930959
	(num_hops = 1); Mon, 05 Mar 2012 16:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=rLRfUYV12kuBCFXroVng5Bp0EgxoMixAD6hjuKzo/Dw=;
	b=e6frGF6EeU9M/S2/wpHnaOb8z1Iyh9LOM0cMKr/9ZH6hlYTU8/oD0o7vNSi93QAgy2
	8HllJrBAfEp3ZxPSmsYW2/oJyh8nivdGQ487xUgjSGuv2fdHLq1uDskZZBgFMjRRsjxd
	Tz29vu7WzOnrXAtMaivCyt9/usHg0UD3Zz6QYSpfFb6yC9Bt7C3moVsjALBj+7xNvzuh
	JTky2iuau+kyAlgNLPEY8Kluaet898UPcZT/VyuXHlJGiTHf+gtdJ38VVJQ3S51hVUwr
	qTdvfpUC3r4Ov2jpHd0wrxDN1rUCIIPwzmd0K47ZIZnJ1m2c2CQtiTtY+PUuGiKs0ThL
	YcWg==
Received: by 10.52.77.101 with SMTP id r5mr34077711vdw.109.1330994930905;
	Mon, 05 Mar 2012 16:48:50 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-49-18.dhcp.embarqhsd.net. [184.3.49.18])
	by mx.google.com with ESMTPS id
	ht6sm27831298vdb.8.2012.03.05.16.48.50 (version=SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 16:48:50 -0800 (PST)
Message-ID: <4F555EF2.7080902@gmail.com>
Date: Mon, 05 Mar 2012 19:48:50 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <4F553F17.8000602@gmail.com> <4F554AAC.3010300@mlbassoc.com>
In-Reply-To: <4F554AAC.3010300@mlbassoc.com>
Subject: Re: building for OE pandaboard with angstrom
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
X-List-Received-Date: Tue, 06 Mar 2012 00:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2012 06:22 PM, Gary Thomas wrote:
> On 2012-03-05 15:32, jfabernathy wrote:
>> Since the README says that to get the complete features of the 
>> pandaboard you need to follow the instructions at the angstrom link 
>> provided, I tried that. The console-image builds
>> and boots, but the systemd-gnome-image fails on a do_fetch. Error 
>> message is below:
>>
>> | ERROR: Function failed: Fetcher failure for URL: 
>> 'ftp://ftp.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20111211.tar.gz'. 
>> Checksum mismatch!
>> | File: 
>> '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz' 
>> has md5 checksum 1047c5bb332e96cac982b2eaf76e84f7 when 
>> f99a90a91b23338b4df765c0d18eba73 was
>> expected
>> | File: 
>> '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz' 
>> has sha256 checksum 
>> 73b8d9f14bd08da79cb2bbb6e8ec3c4de23f2213a2c25fbe07b720dbfc852d73 when
>> 6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7 was 
>> expected
>> NOTE: package ca-certificates-20111211-r0: task do_fetch: Failed
>> ERROR: Task 3064 
>> (/home/jim/poky/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb, 
>> do_fetch) failed with exit code '1'
>
> If you haven't found them elsewhere, I have a copy of those certificates
> at http://www.mlbassoc.com/misc/ca-certificates_20111211.tar.gz
>

Never mind last dumb comment.  I forgot to touch 
ca-certificates_20111211.tar.gz.done.

JIm A



