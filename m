Return-Path: <jfabernathy@gmail.com>
Received: from mail-vw0-f48.google.com (mail-vw0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FEFFE0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 18:29:10 -0800 (PST)
Received: by vbjk17 with SMTP id k17so5717801vbj.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 18:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jfabernathy@gmail.com designates
	10.220.106.144 as permitted sender) client-ip=10.220.106.144; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jfabernathy@gmail.com
	designates 10.220.106.144 as permitted sender)
	smtp.mail=jfabernathy@gmail.com;
	dkim=pass header.i=jfabernathy@gmail.com
Received: from mr.google.com ([10.220.106.144])
	by 10.220.106.144 with SMTP id x16mr256034vco.63.1331000949902
	(num_hops = 1); Mon, 05 Mar 2012 18:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rNZYV5LPEGb16OjWiFW0JQCYZr1gY8PkDx0k0m9yhfA=;
	b=nYTdGdhXWmhBUYcIXhxYvhkRtzqHJxoM7xddlvoaWyYCWuv6sRt1VWZojcOjYZCKPu
	6MgRgEzGEJ779+xoX9YrMjfNT0B4yw1o7HRakt2EOyuoxR8NhAn4WkbwltkqnO96GV+l
	4y3/MwmVsPdAbdHTqXp+cQothAwU6xVXsS08yoCbD0b5EyTTUAisQhK4jlqmwd1cXAUX
	9ODgOPbtl+sGWSgt/nNUpvYe7E3Gd8rCJIUe/xBRS2Gi9uaOhWsKFM4mIZ0a8pBOgWsu
	DTH1q7IZOtqlXZGj2hfmMJ3Ly0nrSERt9wOSJEtdUJc40iFJz6vn+Ux1knzIY2PGrI4G
	jXXA==
Received: by 10.220.106.144 with SMTP id x16mr206089vco.63.1331000949663;
	Mon, 05 Mar 2012 18:29:09 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-49-18.dhcp.embarqhsd.net. [184.3.49.18])
	by mx.google.com with ESMTPS id
	n14sm28223909vdj.22.2012.03.05.18.29.08 (version=SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 18:29:09 -0800 (PST)
Message-ID: <4F557675.8010207@gmail.com>
Date: Mon, 05 Mar 2012 21:29:09 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <4F553F17.8000602@gmail.com> <20120305225809.GE2030@denix.org>
In-Reply-To: <20120305225809.GE2030@denix.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 06 Mar 2012 02:29:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2012 05:58 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 05, 2012 at 05:32:55PM -0500, jfabernathy wrote:
>> Since the README says that to get the complete features of the
>> pandaboard you need to follow the instructions at the angstrom link
>> provided, I tried that.  The console-image builds and boots, but the
>> systemd-gnome-image fails on a do_fetch.  Error message is below:
>>
>> | ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20111211.tar.gz'.
>> Checksum mismatch!
>> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz'
>> has md5 checksum 1047c5bb332e96cac982b2eaf76e84f7 when
>> f99a90a91b23338b4df765c0d18eba73 was expected
>> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz'
>> has sha256 checksum
>> 73b8d9f14bd08da79cb2bbb6e8ec3c4de23f2213a2c25fbe07b720dbfc852d73
>> when
>> 6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7 was
>> expected
>> NOTE: package ca-certificates-20111211-r0: task do_fetch: Failed
>> ERROR: Task 3064 (/home/jim/poky/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb,
>> do_fetch) failed with exit code '1'
> The main debian server no longer hosts 20111211 version of ca-certificates.
> The update to the current 20120212 version is currently pending in meta-oe:
>
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/50963
>
> Meanwhile you can locate the correct version of the tarball and place it in
> your downloads/ directory...
>
I got the systemd-gnome-image to built this time, but the image does not 
completely boot.  I followed the instruction in poky/README.hardware for 
Beagleboard to create the SDcard.  I just took a chance that it would be 
close enough for Pandaboard.  I'm guessing there are some changes to the 
instructions for Pandaboard.  If true, where are they located??

Jim A


