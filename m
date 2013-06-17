Return-Path: <manishv.b@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1858E0152B
	for <meta-ti@yoctoproject.org>; Sun, 16 Jun 2013 21:51:43 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5H4peGZ022922
	for <meta-ti@yoctoproject.org>; Sun, 16 Jun 2013 23:51:41 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5H4pcVq008763
	for <meta-ti@yoctoproject.org>; Sun, 16 Jun 2013 23:51:39 -0500
Received: from dbdp33.itg.ti.com (172.24.170.252) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 17 Jun 2013 12:51:37 +0800
Received: from [172.24.145.213] (smtpvbd.itg.ti.com [172.24.170.250])	by
	dbdp33.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5H4paOO001083;
	Mon, 17 Jun 2013 10:21:36 +0530
Message-ID: <51BE95D8.6080209@ti.com>
Date: Mon, 17 Jun 2013 10:21:36 +0530
From: ManishBadarkhe <manishv.b@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <A4887BF146CD57468F700B415D2F470159EF7A@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C492418@DFLE08.ent.ti.com>
	<20130603185502.GD10512@edge>
	<A4887BF146CD57468F700B415D2F47015A12CD@DBDE04.ent.ti.com>
	<20130613175850.GV3741@edge>
In-Reply-To: <20130613175850.GV3741@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Meta-TI patches for OMAPL138
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
X-List-Received-Date: Mon, 17 Jun 2013 04:51:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On Thursday 13 June 2013 11:28 PM, Denys Dmytriyenko wrote:
Hi Denys,

Thanks for your reply.
> On Wed, Jun 12, 2013 at 12:08:28AM -0400, Vishwanathrao Badarkhe, Manish wrote:
>> Hi Denys
>>
>>> And I, before giving any specific recommendations, would like to
>>> understand how and where these patches fit - what exact machine/platform
>>> is this for and what is the product SDK this goes into? What will be the
>>> support model for that?
             This is for OMAP-L138 platform. It is based on linux v3.3 
and goes into
             03.22.00.04 PSP SDK release. Support model for this is 
DA850-EVM board.
>>>
>>> It does seem to conflict with Sitara AMSDK (am180x-evm based on OMAPL138
>>> SOC) that still uses 2.6.37 kernel. Once I know a little bit more about
>>> this new PSP release 03.22.00.04 for of 3.3 kernel, I'd be able to give
>>> better recommendations on how to properly integrate your work into meta-ti
>>> layer.
>> Please let me know, how to integrate my work into meta-ti layer.
> Manish,
>
> Can you please answer the questions above and I'd be glad to provide you with
> more pointers and support you through your integration efforts. Thanks.
>

Regards
Manish Badarkhe



