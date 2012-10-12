Return-Path: <h-fache@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D8FEE0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 08:58:48 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CFwjjf009767
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:58:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CFwjEv026609
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:58:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 12 Oct 2012 10:58:44 -0500
Received: from [137.167.109.3] (unb0919861.emea.dhcp.ti.com [137.167.109.3])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CFwhCV016593;
	Fri, 12 Oct 2012 10:58:44 -0500
Message-ID: <50783E2F.4060204@ti.com>
Date: Fri, 12 Oct 2012 17:58:39 +0200
From: =?ISO-8859-1?Q?Herv=E9_Fache?= <h-fache@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <507836EF.8050506@ti.com> <20121012153140.GG26956@edge>
In-Reply-To: <20121012153140.GG26956@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Fri, 12 Oct 2012 15:58:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/12/2012 05:31 PM, Denys Dmytriyenko wrote:
> On Fri, Oct 12, 2012 at 05:27:43PM +0200, Herv? Fache wrote:
>> Hi guys,
>>
>> I am new to Poky and have created the following recipe:
>>     require recipes-graphics/images/core-image-x11.bb
>>     IMAGE_INSTALL += "omapdrmtest"
> Can you try adding to CORE_IMAGE_EXTRA_INSTALL instead of IMAGE_INSTALL?
>
Thanks a lot, that did it!

