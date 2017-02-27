Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8C73E0050B; Mon, 27 Feb 2017 10:25:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 355EDE00405
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 10:25:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1RIPSxJ022149
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 12:25:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1RIPSO4024942
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 12:25:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Feb 2017 12:25:27 -0600
Received: from [128.247.83.68] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1RIPR4P005980;
	Mon, 27 Feb 2017 12:25:27 -0600
To: Denys Dmytriyenko <denys@ti.com>, Karthik Ramanan <a0393906@ti.com>
References: <1487994622-87927-1-git-send-email-a0393906@ti.com>
	<20170227182008.GB11106@edge>
From: Suman Anna <s-anna@ti.com>
Message-ID: <4c3c43cc-fd31-ecc7-2f47-73fc44c28732@ti.com>
Date: Mon, 27 Feb 2017 12:25:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170227182008.GB11106@edge>
X-Mailman-Approved-At: Mon, 27 Feb 2017 14:46:43 -0800
Cc: meta-ti@yoctoproject.org
Subject: Re: [krogoth] ti-ipc: update to 3.45.00.00
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
X-List-Received-Date: Mon, 27 Feb 2017 18:25:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys,

On 02/27/2017 12:20 PM, Denys Dmytriyenko wrote:
> Karthik,
> 
> Why are you upgrading IPC in krogoth to 3.45? I thought that was mainly to 
> work with 4.9 kernel...

FYI, 3.45 will work with 4.4 kernel as well, but 4.9 will not work with
IPC 3.44. That said, there are couple of minor bug fixes for Android and
static code analysis fixes. I am not sure if these are required for
their upcoming GA releases.

regards
Suman

