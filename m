Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A408AE00AE4; Tue, 25 Apr 2017 04:29:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.19.16 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68D6AE00A9B
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 04:29:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PBT1tS010124
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493119741;
	bh=kx/ta+pZlbUwWGPopK2BGCQswuA/qERazKS8bib7/Aw=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=IK38GTbDz2skeJ7m9WxhhJPlYGffLe39ig+pi7EH6vPiMXF72OU+cNjWcooerhpNM
	bV039LdXGYSppRy9kYoMy/L7gdAsp14VCpc6FaGEhMEXLQ5kML7i7dZqzJNPw7PdZ2
	lbrtvFKmsUV1LfgYXG0KmkU/chglkSCYbZiRskhQ=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBSs1u007974
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:28:55 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBSqbT013491
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 16:58:53 +0530
Received: from [172.24.159.169] (172.24.159.169) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 16:58:51 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1492784105-58653-1-git-send-email-a0393906@ti.com>
	<bc8f561f-870e-c493-1696-ab2910b091ce@ti.com> <58FDF89D.3000509@ti.com>
	<20170424173559.GC24846@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58FF32F3.3030307@ti.com>
Date: Tue, 25 Apr 2017 16:58:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170424173559.GC24846@edge>
X-Originating-IP: [172.24.159.169]
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty PATCH v2 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Tue, 25 Apr 2017 11:29:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

I've taken care of your comments:
* renamed the recipe to include the version name.
* also made it native.

Posted v3.

Regards
Karthik

On 24-Apr-17 11:06 PM, Denys Dmytriyenko wrote:
> On Mon, Apr 24, 2017 at 06:37:41PM +0530, Karthik Ramanan wrote:
>> Jake, Denys - some questions for you.
>>
>>>> +PV = "16.9.2"
>>> Would it be better to have this in the recipe filename? I'm not
>> sure if there is a preference.
>> Denys, what is the recommendation? I see both approaches, I can
>> rework and submit if the PV should be included in the filename.
> Depends on how often you plan to update the recipe and whether you will have
> between-releases snapshots. That's usually the case with git-based components.
> In case of tarball or binary-installer components, the convention is to use
> the version in the filename.
>
>
>>>> +BBCLASSEXTEND = "native nativesdk"
>>> It appears that there is not support for the "target" class as the
>> installer is for the x86 architecture.
>> Just to be clear, would it be fine to just remove the nativesdk?
> Are there plans to have ARM installer? If not, then "target" recipe with
> BBCLASSEXTEND won't work - you just need to do a -native recipe directly.
>


