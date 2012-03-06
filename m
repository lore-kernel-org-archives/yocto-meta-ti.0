Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99256E0070C
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 03:34:07 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E991EF8121F; Tue,  6 Mar 2012 04:34:06 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id AF1F0F8121F;
	Tue,  6 Mar 2012 04:34:05 -0700 (MST)
Message-ID: <4F55F62D.3030304@mlbassoc.com>
Date: Tue, 06 Mar 2012 04:34:05 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: jfabernathy <jfabernathy@gmail.com>
References: <4F553F17.8000602@gmail.com> <20120305225809.GE2030@denix.org>
	<4F557675.8010207@gmail.com>
In-Reply-To: <4F557675.8010207@gmail.com>
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
X-List-Received-Date: Tue, 06 Mar 2012 11:34:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-05 19:29, jfabernathy wrote:
> On 03/05/2012 05:58 PM, Denys Dmytriyenko wrote:
>> On Mon, Mar 05, 2012 at 05:32:55PM -0500, jfabernathy wrote:
>>> Since the README says that to get the complete features of the
>>> pandaboard you need to follow the instructions at the angstrom link
>>> provided, I tried that. The console-image builds and boots, but the
>>> systemd-gnome-image fails on a do_fetch. Error message is below:
>>>
>>> | ERROR: Function failed: Fetcher failure for URL: 'ftp://ftp.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20111211.tar.gz'.
>>> Checksum mismatch!
>>> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz'
>>> has md5 checksum 1047c5bb332e96cac982b2eaf76e84f7 when
>>> f99a90a91b23338b4df765c0d18eba73 was expected
>>> | File: '/home/jim/poky/setup-scripts/sources/downloads/ca-certificates_20111211.tar.gz'
>>> has sha256 checksum
>>> 73b8d9f14bd08da79cb2bbb6e8ec3c4de23f2213a2c25fbe07b720dbfc852d73
>>> when
>>> 6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7 was
>>> expected
>>> NOTE: package ca-certificates-20111211-r0: task do_fetch: Failed
>>> ERROR: Task 3064 (/home/jim/poky/setup-scripts/sources/meta-openembedded/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb,
>>> do_fetch) failed with exit code '1'
>> The main debian server no longer hosts 20111211 version of ca-certificates.
>> The update to the current 20120212 version is currently pending in meta-oe:
>>
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded/50963
>>
>> Meanwhile you can locate the correct version of the tarball and place it in
>> your downloads/ directory...
>>
> I got the systemd-gnome-image to built this time, but the image does not completely boot. I followed the instruction in poky/README.hardware for Beagleboard to create the SDcard. I
> just took a chance that it would be close enough for Pandaboard. I'm guessing there are some changes to the instructions for Pandaboard. If true, where are they located??

What do you mean "does not completely boot?"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

