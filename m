Return-Path: <m-karicheri2@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id DCABBE00312
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 11:53:53 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QJrrsJ027378
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 13:53:53 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QJrqVu031014
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 13:53:52 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 13:53:52 -0600
Received: from [158.218.101.175] (gtla0868495.am.dhcp.ti.com
	[158.218.101.175])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1QJrq04002381;	Tue, 26 Feb 2013 13:53:52 -0600
Message-ID: <512D12D0.7090804@ti.com>
Date: Tue, 26 Feb 2013 14:53:52 -0500
From: Murali Karicheri <m-karicheri2@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Tom Rini <trini@ti.com>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com>
In-Reply-To: <512D0D9F.8050705@ti.com>
Cc: meta-ti@yoctoproject.org, ceh@ti.com
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 19:53:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

+ Cyril,

Cyril had worked on adding GPH format for u-boot. Want to hear from him 
why not used the u-boot-with-spl.bin build target.

Murali
On 2/26/2013 2:31 PM, Tom Rini wrote:
> On 02/26/2013 02:20 PM, Denys Dmytriyenko wrote:
>> On Tue, Feb 26, 2013 at 01:42:31PM -0500, Murali Karicheri wrote:
>>> Denys,
>>>
>>> I understand that this recipe is  not complete as u-boot_2013.01.bb
>>> may be shared by other machines and this change is not applicable.
>>> Do I need to add this to some other file? Please advise.
>>>
>>> Meanwhile for the release this should work as this is going into
>>> mcsdk meta-ti repo. But to push this to meta-ti, the above change is
>>> needed and hence need your input.
>> Murali,
>>
>> I know Carlos has been working on adding SPL support to u-boot already:
>>
>> http://arago-project.org/pipermail/meta-arago/2013-February/000937.html
>>
>> Can you sync up with him and come up with a unified solution for both SPL and
>> GPH images that works for everybody and I'd be happy to push it to meta-ti.
>>
>> Also, I'd like to hear Tom's opinion on this, as current U-Boot maintainer -
>> if there is a better approach to this exists or planned in mainline.
> I haven't seen the keystone patches yet, so I don't know if the GPH
> image is "special" in terms of headers, but the build target
> u-boot-with-spl.bin is the canonical build target for "put
> u-boot-spl.bin and u-boot.bin together".
>


