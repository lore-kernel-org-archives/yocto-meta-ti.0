Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85E4EE00AB0; Thu, 29 Oct 2015 08:01:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18BF0E00A28
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 08:01:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9TF1Dns005289
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 10:01:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TF1DiZ008427
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 10:01:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Oct 2015 10:01:13 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TF1DCg019946;
	Thu, 29 Oct 2015 10:01:13 -0500
Message-ID: <563234B9.10008@ti.com>
Date: Thu, 29 Oct 2015 11:01:13 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1445965004-1470-1-git-send-email-j-stiffler@ti.com>
	<5632115B.4080604@ti.com> <20151029143135.GB8780@edge>
In-Reply-To: <20151029143135.GB8780@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC 0/2] LLD cleanup and device split
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
X-List-Received-Date: Thu, 29 Oct 2015 15:01:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/2015 10:31 AM, Denys Dmytriyenko wrote:
> On Thu, Oct 29, 2015 at 08:30:19AM -0400, Jacob Stiffler wrote:
>> Any comments?
>>
>> If not, I will submit similar patches for all of the LLDs.
> In general it looks fine, but are you going to export each and every LLD's
> URL, branch and commit into variables?

That is the plan, but it will be tedious task.

The problem is that these LLDs are developed internally, so for our 
internal builds, we would like to override only git repo in the SRC_URI 
to the internal repos along with AUTOREVing. This will be beneficial 
when the git repo is shared between multiple recipes (e.g. lib and test 
recipes), or when there is another file added to the SRC_URI (e.g. an 
init script).

>
>> On 10/27/2015 12:56 PM, Jacob Stiffler wrote:
>>> I plan to clean up the LLD recipes and split up the device-specific
>>> libraries to only the relevant machine. There are quite a few LLDs
>>> which will need this clean up so I wanted to submit an RFC before
>>> proceeding with the rest of them.
>>>
>>> Jacob Stiffler (2):
>>>    cppi-lld: Clean up recipes
>>>    cppi-lld: Only build binaries relevent to the machine
>>>
>>>   recipes-bsp/cppi-lld/cppi-lld-test_git.bb |  2 ++
>>>   recipes-bsp/cppi-lld/cppi-lld.inc         | 24 ++++++++++++++++++------
>>>   recipes-bsp/cppi-lld/cppi-lld_git.bb      | 13 +++++++++++--
>>>   3 files changed, 31 insertions(+), 8 deletions(-)
>>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


