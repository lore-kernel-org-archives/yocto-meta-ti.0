Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3675FE0074A
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 08:43:26 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 077ACF81218; Mon,  5 Mar 2012 09:43:24 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9CE4EF811F5;
	Mon,  5 Mar 2012 09:43:13 -0700 (MST)
Message-ID: <4F54ED21.9000208@mlbassoc.com>
Date: Mon, 05 Mar 2012 09:43:13 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
In-Reply-To: <alpine.DEB.2.02.1203051138060.14598@oneiric>
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 05 Mar 2012 16:43:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-05 09:39, Robert P. J. Day wrote:
> On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:
>
>> Hi,
>>
>> I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
>>
>> You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-panda.conf:
>
>    i noticed that koen just submitted a sizable patch that gets rid of
> that conf file for the panda, and standardizes on the pandaboard.conf
> file (at least that's what it looked like).
>
>    under the circumstances, it might be worth just waiting until that
> patch works its way through the system and start testing all over
> again when it hits.

Yes, you'll also get a newer kernel (3.0.2 last I looked, not 2.6.35)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

